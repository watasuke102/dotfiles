return {
  {
    "navarasu/onedark.nvim",
    lazy     = false,
    priority = 990,
    config   = function() vim.cmd("colorscheme onedark") end,
    opts     = {
      code_style = {
        comments = "none",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy         = false,
    priority     = 980,
    opts         = {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'lsp_status' },
        lualine_y = { 'encoding', 'filetype' },
        lualine_z = { 'location' }
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            symbols = { alternate_file = '' }
          }
        }
      },
    }
  },
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
  { -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false -- clear input by C-u
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
          diagnostics = {
            previewer = false,
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
    },
    keys = function()
      local com = function(fname)
        return string.format("<cmd>lua require('telescope.builtin').%s()<CR>", fname)
      end
      return {
        { "<leader>fb", com("buffers") },
        { "<leader>fg", com("live_grep") },
        { "<leader>ff", com("find_files") },
        { "<leader>fa", com("diagnostics") },
        { "<leader>fc", com("command_history") },
        { "<leader>fr", com("lsp_references") },
        { "<leader>fd", com("lsp_definitions") },
        { "<leader>fi", com("lsp_implementations") },
        { "<leader>ft", com("lsp_type_definitions") },
        { "<leader>fs", com("lsp_document_symbols") },
        { "<leader>fS", com("lsp_workspace_symbols") },
      }
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
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
