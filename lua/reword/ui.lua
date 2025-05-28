local M = {}

function M.select_synonym(original, synonyms)
  vim.ui.select(synonyms, { prompt = "Replace '" .. original .. "' with:" }, function(choice)
    if choice then
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line = vim.api.nvim_get_current_line()

      -- Replace the word under cursor with the chosen synonym
      local new_line = line:gsub("%f[%w]" .. original .. "%f[%W]", choice, 1)
      vim.api.nvim_set_current_line(new_line)
    end
  end)
end

return M
