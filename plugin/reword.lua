vim.api.nvim_create_user_command("Reword", function()
  require("reword").reword_word()
end, { desc = "Find and replace word udner cursor with a synonym" })

vim.keymap.set("n", "<leader>rw", function()
  require("reword").reword_word()
end, { desc = "Reword: Replace with synonym", noremap = true, silent = true })

