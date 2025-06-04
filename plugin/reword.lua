vim.api.nvim_create_user_command("Reword", function()
  require("reword").reword_word()
end, {})

vim.keymap.set("n", "<leader>rw", function()
  require("reword").reword_word()
end, { desc = "Reword: Find synonyms" })
