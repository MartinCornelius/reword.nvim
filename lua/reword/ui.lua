local M = {}

local win_id

function M.display_synonyms(word, synonyms)
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_win_close(win_id, true)
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local lines = { "Synonyms for: " .. word }
  vim.list_extend(lines, synonyms)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = 30
  local height = #lines
  local row = 1
  local col = vim.o.columns - width - 2

  win_id = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
  })

  -- vim.defer_fn(function()
  --   if win_id and vim.api.nvim_win_is_valid(win_id) then
  --     vim.api.nvim_win_close(win_id, true)
  --   end
  -- end, 3000) -- auto closes after 3 seconds
end

return M
