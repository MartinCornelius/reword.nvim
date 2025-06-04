local M = {}

local win_id = nil
local buf_id = nil

--- Close the popup window if it's open
function M.close_popup()
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_win_close(win_id, true)
    win_id = nil
    buf_id = nil
  end
end

local function create_popup(lines, opts)
  M.close_popup()

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = opts.width or 50
  local height = math.min(#lines, opts.max_height or 15)
  local row = opts.row or 1
  local col = opts.col or (vim.o.columns - width - 2)

  win_id = vim.api.nvim_open_win(buf, false, {
    relative = opts.relative or "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = opts.border or "rounded",
  })

  buf_id = buf

  -- Add keybinding to close popup with <Esc>
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '', {
    noremap = true,
    silent = true,
    callback = M.close_popup,
  })

  -- Optional: close on CursorMoved or InsertEnter
  vim.cmd([[
  augroup RewordPopup
  autocmd!
  autocmd CursorMoved,InsertEnter * lua require("reword.ui").close_popup()
  augroup END
  ]])
end

--- Display synonyms
function M.display_synonyms(word, synonyms)
  if not synonyms or #synonyms == 0 then
    return
  end

  local lines = { "Synonyms for: " .. word, "" }
  vim.list_extend(lines, synonyms)

  create_popup(lines, {
    width = 40,
    max_height = 10,
    row = 1,
    col = vim.o.columns - 42,
    border = "single",
  })
end

--- Display definitions
function M.show_definitions(word, definitions)
  if not definitions or #definitions == 0 then
    return
  end

  local lines = { "Definitions for: " .. word, "" }
  vim.list_extend(lines, definitions)

  create_popup(lines, {
    width = 60,
    max_height = 12,
    row = 1,
    col = vim.o.columns - 62,
    border = "rounded",
  })
end

return M

