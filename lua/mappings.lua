local vim = vim
local map = vim.keymap.set
local telescope = require "telescope.builtin"

map("i", "<C-a>", "<ESC>^i")
map("i", "<C-e>", "<End>")
map("n", "0", "^")
map("n", "^", "0")
map("n", ";", ":", { nowait = true })

map("v", ">", ">gv")
map("v", "<", "<gv")
map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<C-p>", "<cmd> Telescope find_files <CR>")
map("n", "<C-z>", "<cmd> Telescope live_grep <CR>")
map("n", "<S-b>", "<cmd> Telescope git_bcommits <CR>")

map("n", "<Leader>z", "1z=")

map("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)
map("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end)

map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end)

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end)

map("n", "<C-q>", function()
  require("nvchad.tabufline").close_buffer()
end)

map("n", "gd", function()
  require("telescope.builtin").lsp_definitions()
end)
map("n", "gi", telescope.lsp_implementations)
map("n", "gr", telescope.lsp_references)
map("n", "<leader>rn", vim.lsp.buf.rename)
-- map("n", "<leader>rn", require "nvchad.lsp.renamer")

map("n", "<C-s>", "<cmd>w<CR>", { desc = "File Save" })
