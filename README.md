# reword.nvim
A lightweight Neovim plugin to quickly find and swap synonyms while writing - without ever leaving Neovim.

## Requirements
- Neovim `0.8+`
- Internet connection (for now - local caching coming)

## Installation
Just like any other plugin. 

Example using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{ 'martincornelius/reword.nvim' }
```

## Usage
For now, hover over a word in Neovim and press `<leader>rw` to bring up synonyms.


## Acknowledgments
This plugin uses the [Datamuse API](https://www.datamuse.com/api/) to fetch synonyms and related words.

> The Datamuse API is a free word-finding query service for developers.  
> Big thanks to the team behind it for making such a useful tool publicly available.
