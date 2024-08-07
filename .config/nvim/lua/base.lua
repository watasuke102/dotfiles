vim.opt.clipboard:append{ "unnamedplus", "unnamed" }
vim.opt.encoding    = "utf-8"
vim.opt.list        = true
vim.opt.number      = true
-- relative number
vim.opt.rnu         = true
vim.opt.swapfile    = false
vim.opt.mouse       = ""
vim.opt.whichwrap   = "b,s,h,l,<,>,[,]"
vim.opt.backspace   = "indent,eol,start"

vim.opt.smarttab    = true
vim.opt.expandtab   = true
-- use same indentation for new line
vim.opt.autoindent  = true
vim.opt.smartindent = true
-- amount of automatic indent
vim.opt.shiftwidth  = 2
-- amount of indentation by <Tab>
vim.opt.tabstop     = 2

vim.opt.incsearch   = true
vim.opt.hlsearch    = true
-- case sensitive only when the pattern contains upper char
vim.opt.smartcase   = true

-- highlight corresponding braces
-- vim.opt.showmatch   = true
vim.opt.showcmd     = true

-- vim.g.rustfmt_autosave = 1

