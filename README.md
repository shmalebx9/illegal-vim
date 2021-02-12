# Illegal vim

![ivim](https://github.com/shmalebx9/illegal-vim/raw/assets/ivim.png)

## Requirements

+ Nerd Fonts. I'm using [Iosevka](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Iosevka)
+ nnn-nerd. Get it as a static binary from the [releases](https://github.com/jarun/nnn/releases)
+ Vim-Plug. Follow their [instructions](https://github.com/junegunn/vim-plug)
+ neovim. Get it from your distro's repo.
+ [Alacritty terminal](https://github.com/alacritty/alacritty). Get it from your distro's repo.
+ Python3 and pyvim. Get pip3 from your distro's repo.
+ wmctrl. Get it from your distro's repo.

## Installation

+ Clone the repo & enter directory
+ Copy gtk theme to match ayu theme.

+ Copy configs to .config/nvim/

`cp *.vim ~/.config/nvim/`

+ Copy svim to somewhere in your $ PATH

`cp svim ~/.local/bin/ && chmod +x ~/.local/bin/svim`

+ Launch svim and run PlugInstall

`:PlugInstall`

## Usage

Initiate with `svim` script rather than nvim directly. The svim script will open nvim in server mode if no files are given. If files are supplied then they will be opened in the running instance of nvim. If nvim is not running and files are supplied then they will be opened with nvim in server mode. This is similar to the behaviour of sublime text.

### Tab Navigation

<kbd>PageUp</kbd>	Go to next 

<kbd>PageDown</kbd>	Go to previous 

<kbd>Ctrl+w</kbd>	Close current buffer 

### "normal" keybinds

<kbd>Ctrl+s</kbd>	Save the current buffer

<kbd>Ctrl+c</kbd>	Copy selected text (to secondary)

<kbd>Ctrl+v</kbd>	Paste selected text (from secondary)

### Spelling

<kbd>Ctrl+u</kbd>		Correct misspelled word under cursor 

<kbd>ZN</kbd>		Go to next misspelled word

<kbd>ZP</kbd>		Go to last misspelled word

More at [spelunker](https://github.com/kamykn/spelunker.vim/blob/master/README.md)

## Markdown helpers
<kbd>Ctrl+t</kbd>	Insert a bullet point

<kbd>Ctrl+b</kbd>	Insert bolding (\*\*)

## Credits

nana-4 for [materia-theme](https://github.com/nana-4/materia-theme)

