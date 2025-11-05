-- This file is expected to be loaded first
-- so that ensure that following plugins are loaded even if other plugin config causes errors
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
        lualine_c = { { 'filename', path = 1 } }, -- 1: relative path
        lualine_x = { 'lsp_status' },
        lualine_y = { 'encoding', 'filetype' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1 } },
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
}
