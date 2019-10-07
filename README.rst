Ctrl-z plugin
=======

This plugin mimics the behavior of terminal based NeoVim's `<Ctrl-z>` command by using the NeoVim's internal terminal buffer instead of the global commandline.

Without this plugin: `<Ctrl-z>` hotkey is commonly used to temporary make current NeoVim process a background process while executing a vim command on the commandline.

With this plugin: `<Ctrl-z>` hotkey opens NeoVim internal terminal buffer in insert mode. If `<Ctrl-z>` is hit again that last active buffer is open again.

#### Todo

* Full screen terminal mode

## Installation and Documentation

### Installation

Place this in your `init.vim`:
```
Plug 'philippgawlik/vim-ctrlz'
```
... then run the following  in NeoVim:
```
:source %
:PlugInstall
```

### Features & Configuration

* key-binding to open/change to terminal buffer (replace `<C-z>` by whatever hotkey you like):

	`nnoremap <C-z> :call ControlZ("terminal")<CR>`

* key-bind to jump back from terminal buffer to last buffer (or stay if no other buffer available)

	`tnoremap <C-z> <C-\><C-n>:call JumpToPreviousBuffer()<CR>`

### Tested for

1. NeoVim v0.4.2
### Requirements

* NeoVim (Todo: further specify)