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

---

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{ "martincornelius/reword.nvim" }
```

---

## Usage
| Keybinding   | Action           |
| ------------ | ---------------- |
| `<leader>rw` | Show synonyms    |
| `<leader>rd` | Show definitions |

---

## Acknowledgments
This plugin uses the free [Free Dictionary API](https://dictionaryapi.dev/) for definitions and synonyms.
