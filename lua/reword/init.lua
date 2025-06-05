local M = {}

local api = require("reword.api")
local ui = require("reword.ui")

function M.setup(opts)
  require("reword.cache").setup(opts or {})
end

function M.reword_word()
  local word = vim.fn.expand("<cword>")
  if not word or word == "" then
    vim.notify("No word found under cursor", vim.log.levels.WARN)
    return
  end

  api.get_synonyms(word, function(synonyms)
    ui.display_synonyms(word, synonyms)
  end)
end

function M.reword_define()
  local word = vim.fn.expand("<cword>")
  if not word or word == "" then
    vim.notify("No word found under cursor", vim.log.levels.WARN)
    return
  end

  api.get_definitions(word, function(definitions)
    ui.show_definitions(word, definitions)
  end)
end

return M
