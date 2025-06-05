# reword.nvim

**reword.nvim** is a lightweight Neovim plugin for writers, developers, and note-takers who want fast, in-editor synonym and definition lookup — without breaking flow.

> No GUI pop-ups. No switching tabs. Just language tools where you write.

### Synonym popup
Here’s how the plugin shows synonyms for the word **explanation**:
![image](https://github.com/user-attachments/assets/addfed4f-00fa-466b-866a-55175041d71b)

### Definition popup
Definition view for the word **explanation**:
![image](https://github.com/user-attachments/assets/00761257-74c2-4cd6-8301-48ac71bccada)

---

## Features

- Quickly find synonyms or definitions for any word under the cursor
- Displays results in a floating window (non-intrusive)
- Uses [Free Dictionary API](https://dictionaryapi.dev/) — no API key required

---

## Requirements

- Neovim `0.8+`
- Internet connection (temporarily required)
- [curl](https://curl.se/) available in your system path

---

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{ 
    "martincornelius/reword.nvim",
    config = function()
        require("reword").setup({
            persist = true, -- Enable persistent local cache (default: true)
        })
    end
}
```

---

## Usage
| Keybinding   | Action           |
| ------------ | ---------------- |
| `<leader>rw` | Show synonyms    |
| `<leader>rd` | Show definitions |

The follow commands are also available:
- `:Reword` Show synonyms
- `:RewordDefine` Show definitions
- `:RewordClearCache` Clear the synonym/definition cache

---

## Caching
To improve performance and reduce repeated network API calls:
- Results are cached **in memory** by default
- If `persist = true` (default), cache is also stored **to disk** (across sessions)
- You can **disable persistence** via setup:
```lua
require("reword").setup({ persist = false })
```

### Clearing the cache
If you want to clear the cache (memory + disk):
```lua
:RewordClearCache
```

or you can manually delete the file `reword_cache.json` inside your neovim data folder.

---

## Acknowledgments
This plugin uses the free [Free Dictionary API](https://dictionaryapi.dev/) for definitions and synonyms.
