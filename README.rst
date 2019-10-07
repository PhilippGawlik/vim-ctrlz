# Ctrl-z plugin

This plugin mimics the behavior of terminal based NVim/Vim8's `<Ctrl-z>` command by using the NVim/Vim8's internal terminal buffer instead of the global commandline.

Without this plugin: `<Ctrl-z>` hotkey is commonly used to temporary make current NVim/Vim process a background process while executing a vim command on the commandline.

With this plugin: `<Ctrl-z>` hotkey opens NVim/Vim8 internal terminal buffer in insert mode. If `<Ctrl-z>` is hit again that last active buffer is open again.

### Todo

* Full screen terminal mode

## Installation and Documentation

### Installation

### Tested for

1. NVIM v0.4.2

### Features & Configuration

* key-binding to open/change to terminal buffer (replace `<C-z>` by whatever hotkey you like):

	`nnoremap <C-z> :call ControlZ("terminal")<CR>`

* key-bind to jump back from terminal buffer to last buffer (or stay if no other buffer available)

	`tnoremap <C-z> <C-\><C-n>:call JumpToPreviousBuffer()<CR>`

## Requirements

None

## Author & Feedback
