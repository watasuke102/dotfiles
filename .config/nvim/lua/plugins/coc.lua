return {{
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.g.coc_global_extensions = {
        "coc-rust-analyzer",
        "coc-clangd",
        "coc-tsserver",
        "coc-json",
      }
      -- I want to use these shorthand expression
      -- so set map in config() instead of `keys` by lazy.nvim
      local map = vim.api.nvim_set_keymap
      local o   = function (noremap)
        return { noremap=noremap and true or false, expr=true, silent=true }
      end
      map("i",     "<Tab>", 'coc#pum#visible() ? coc#pum#next(1) :   "<Tab>"', o())
      map("i",   "<S-Tab>", 'coc#pum#visible() ? coc#pum#prev(1) : "<S-Tab>"', o())
      map("i",      "<CR>", 'coc#pum#visible() ? "<C-y>"         :    "<CR>"', o(false))
      map("i", "<C-Space>", "coc#refresh()", o())
      map("n", "gd", "<Plug>(coc-definition)", o())
      map("n", "gy", "<Plug>(coc-type-definition)", o())
      map("n", "gi", "<Plug>(coc-implementation)", o())
      map("n", "gr", "<Plug>(coc-references)", o())
    end,
  }}
