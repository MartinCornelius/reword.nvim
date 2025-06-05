-- COMMANDS
vim.api.nvim_create_user_command("Reword", function()
  require("reword").reword_word()
end, {})

vim.api.nvim_create_user_command("RewordDefine", function()
  require("reword").reword_define()
end, {})

vim.api.nvim_create_user_command("RewordClearCache", function()
  require("reword.cache").clear_cache()
  vim.notify("Reword cache cleared", vim.log.levels.INFO)
end, {})

-- KEYBINDINGS
vim.keymap.set("n", "<leader>rw", function()
  require("reword").reword_word()
end, { desc = "Reword: Find synonyms" })

vim.keymap.set("n", "<leader>rd", function()
  require("reword").reword_define()
end, { desc = "Show definition of word under cursor" })

