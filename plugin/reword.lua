vim.api.nvim_create_user_command("Reword", function()
  require("reword").reword_word()
end, {})

vim.keymap.set("n", "<leader>rw", function()
  require("reword").reword_word()
end, { desc = "Reword: Find synonyms" })

vim.keymap.set("n", "<leader>rd", function()
  require("reword").reword_define()
end, { desc = "Show definition of word under cursor" })
