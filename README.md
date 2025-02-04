# nu_plugin_bg

This is a nushell pluging that attempts to start programs in the background.

## Usage:

```nushell
❯ bg --help
Start a process in the background.

Usage:
  > bg {flags} <command>

Flags:
  -h, --help - Display the help message for this command
  -a, --arguments <List(String)> - The arguments of the command.
  -d, --debug - Debug mode
  -p, --pid - Return process ID

Parameters:
  command <string>: The command to start in the background.

Examples:
  Start a command in the background
  > bg some_command --arguments [arg1 --arg2 3]
```

## Known Issues

If you start a program that writes to stdout, you'll get an error. This what I get on my Mac and I'm not really sure what it means. It could have nothing to do with writing to stdout?

```nushell
❯ bg cat -a [cargo.toml] -d
Starting process: 'cat' with args '["cargo.toml"]'
cat: cargo.toml: Broken pipe (os error 32)
```

# Using Nix

## Install

Using Home-Manager:

```nix
_: {
    programs.nushell = {
        enable = true;
        plugins = [
            (pkgs.callPackage (pkgs.fetchFromGitHub {
                owner = "Elbtalkessel";
                repo = "nu_plugin_bg";
                rev = "v0.5.0";
                hash = "";
            }) { })
        ];
    };
}
```

Use `nix-prefetch-url` or switch to the new home-manager configuration to get hash in error message.

## Build

```shell
nix build
```

## Dev shell

```nushell
nix develop -c $env.SHELL
```
