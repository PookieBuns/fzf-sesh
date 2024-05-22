# fzf-sesh

[fzf][fzf] integration for [sesh][sesh].

[fzf]: https://github.com/junegunn/fzf
[sesh]: https://github.com/joshmedeski/sesh
[fzf-tmux]: https://github.com/junegunn/fzf/blob/master/bin/fzf-tmux

## But sesh already provided bindings for fzf in the README!

Yes, but currently, the bindings don't support nerd font icons, and require some manual setup to get working. This script aims to provide an out of the box bridge between fzf and sesh with the following features

- `fzf-sesh` command to launch a sesh picker with fzf
- Support fzf picker with icons and handles postprocessing of the selected session to connect to
- (Optional) replace `sesh` and `sesh connect` without arguments to launch the fzf sesh picker

## Prerequisites

- A nerd font patched terminal
- [fzf][fzf] with [fzf-tmux][fzf-tmux]
- [sesh][sesh]

## Installation

Clone this repository to your machine (e.g. `~/.local/share/fzf-sesh`).

```sh
git clone https://github.com/PookieBuns/fzf-sesh.git ~/.local/share/fzf-sesh
```

If you want to replace the default `sesh` command with `fzf-sesh`, add the following to your shell configuration file (e.g. `~/.bashrc` or `~/.zshrc`).

```sh
source ~/.local/share/fzf-sesh/bin/fzf-sesh
```

If you want to use `fzf-sesh` as a separate command instead, add the executable to your `PATH`.

```sh
export PATH=$PATH:$HOME/.local/share/fzf-sesh/bin
```

## Usage

- Outside of tmux

  `fzf-sesh` will open up a fzf picker to select a session to connect to.

- Inside of tmux

  `fzf-sesh` will call the [fzf + tmux](https://github.com/joshmedeski/sesh?tab=readme-ov-file#tmux--fzf) tmux popup picker to manage your current tmux sessions.
