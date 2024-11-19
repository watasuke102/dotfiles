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

-- toggle terminal by:
-- https://github.com/3BD-R/nvim/blob/main/lua/basic/term.lua
local term_win_id = nil
local term_buffer = nil
local cmd = vim.api.nvim_command
function toggle_terminal()
  if vim.fn.win_gotoid(term_win_id) == 1 then
    -- close
    cmd("hide")
  else
    -- open
    if vim.fn.bufexists(term_buffer) ~= 1 then
      -- create window
      cmd("au TermOpen * setlocal nonumber norelativenumber signcolumn=no")
      cmd("sp | winc J | res 10 | te")
      term_win_id = vim.fn.win_getid()
      term_buffer = vim.fn.bufnr('%')
    elseif vim.fn.win_gotoid(term_win_id) ~= 1 then
      -- re-attach window
      cmd("sb " .. term_buffer .. "| winc J | res 10")
      term_win_id = vim.fn.win_getid()
    end
    cmd("startinsert")
  end
end
vim.keymap.set({"n", "t"}, "<C-a>", toggle_terminal, o)

