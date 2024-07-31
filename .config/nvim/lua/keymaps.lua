local map = vim.api.nvim_set_keymap
local o   = { noremap = true }

-- use Space as a leader
-- must be placed before loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map("n", "<leader>w", "<cmd>w<CR>", o)
map("n", "<C-h>",     "<cmd>noh<CR>", o)

-- buffer
map("n", "<leader>h", "<cmd>bprev<CR>", o)
map("n", "<leader>l", "<cmd>bnext<CR>", o)

-- swap lines
map("n", "<C-j>", "ddp", o)
map("n", "<C-k>", "ddkP", o)

