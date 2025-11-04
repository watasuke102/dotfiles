return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      local hl = { "CursorColumn", "Whitespace" }
      return require("ibl").setup {
        indent = { highlight = hl, char = " " },
        whitespace = {
          highlight = hl,
          remove_blankline_trail = false,
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { relativenumber = true, adaptive_size = true }
    },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
    keys = function()
      return { { "<C-b>", function()
        local api = require("nvim-tree.api")
        if not api.tree.is_visible() then
          api.tree.open()
          return
        end
        -- close if tree is already focused
        if api.tree.is_tree_buf() then
          api.tree.close()
        else
          api.tree.focus()
        end
      end
      } }
    end,
    init = function()
      -- open nvim-tree when Neovim open a directory
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function(data)
          local bufname = vim.api.nvim_buf_get_name(data.buf)
          if vim.fn.isdirectory(bufname) == 1 then
            -- Close the directory buffer that was just opened
            vim.api.nvim_buf_delete(data.buf, {})
            -- Open nvim-tree for this directory instead
            require("nvim-tree.api").tree.open({ path = bufname })
          end
        end
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  { "tpope/vim-surround",        event = "VeryLazy" },
  { "numToStr/Comment.nvim",     event = "VeryLazy" },
  { "easymotion/vim-easymotion", event = "VeryLazy" },
  -- show abs line number only under insert mode
  { "myusuf3/numbers.vim",       event = "InsertEnter" },
}
