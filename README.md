# Illegal vim

## Requirements

+ Nerd Fonts. I'm using [FiraCode](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
+ nnn-nerd. Get it as a static binary from the [releases](https://github.com/jarun/nnn/releases)
+ Vim-Plug. Follow their [instructions](https://github.com/junegunn/vim-plug)
+ gvim. Get it from your distro's repo.

## Installation

+ Clone the repo & enter directory
+ Copy gtk theme to match ayu theme.
`cp -r materia-ayu-m ~./local/share/themes/`
+ Copy vimrc to .vimrc
`cp .vimrc ~/.vimrc`
+ Copy svim to somewhere in your `PATH`
`cp svim ~/.local/bin/ && chmod +x ~/.local/bin/svim`
+ Launch svim and run PlugInstall
`:PlugInstall`

## Usage

Initiate with `svim` script rather than gvim directly to save the session. This will also open new files in the same vim instance if files are provided as an argument.

### Tab Navigation

`PageUp`	Go to next 
`PageDown`	Go to last 
`Ctrl+w`	Close current 

### "normal" keybinds

`Ctrl+s`	Save the current buffer
`Ctrl+c`	Copy selected text (to secondary)
`Ctrl+v`	Paste selected text (from secondary)

### Spelling

`Zl`		Correct misspelled word under cursor 
`ZN`		Go to next misspelled word
`ZP`		Go to last misspelled word

More at [spelunker](https://github.com/kamykn/spelunker.vim/blob/master/README.md)

## Credits

nana-4 for [materia-theme](https://github.com/nana-4/materia-theme)

