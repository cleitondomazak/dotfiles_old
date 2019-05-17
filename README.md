# Doma' dotfiles

> Config files for ZSH, Git, Editors, Terminals and more.

![screenshot][scrn]

[scrn]: /docs/screenshot.png

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `zsh`: to actually run the dotfiles
- `sudo`: some configs may need that

### Install

Then, run these steps:

```console
$ git clone https://github.com/cleitondomazak/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap
$ zsh # or just close and open your terminal again.
```

> All changed files will be backed up with a `.backup` suffix.

### Recommended Software

For macOS, I recommend:

- iTerm: a better terminal emulator;

For Linux:

- Terminator: a better terminal emulator;

### macOS defaults

You use it by running:

```console
$DOTFILES/macos/set-defaults.sh
```

And logging out and in again.

## Further help:

- [Personalize your configs](/docs/PERSONALIZATION.md)
- [Understand how it works](/docs/PHILOSOPHY.md)
- [License](/LICENSE.md)

## Contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with [Shellcheck](https://github.com/koalaman/shellcheck)
and [shfmt](https://github.com/mvdan/sh).

