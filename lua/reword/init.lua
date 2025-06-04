local M = {}

local api = require("reword.api")
local ui = require("reword.ui")

function M.reword_word()
  local word = vim.fn.expand("<cword>")
  if not word or word == "" then
    vim.notify("No word found under cursor", vim.log.levels.WARN)
    return
  end

  api.get_synonyms(word, function(synonyms)
    if not synonyms or #synonyms == 0 then
      vim.notify("No synonyms found", vim.log.levels.INFO)
      return
    end
    ui.display_synonyms(word, synonyms)
  end)
end

return M
