return {
  {
    "navarasu/onedark.nvim",
    lazy     = false,
    priority = 990,
    config = function() vim.cmd("colorscheme onedark") end,
    opts = {
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
    lazy     = false,
    priority = 980,
    opts = {
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'lsp_status'},
        lualine_y = {'encoding', 'filetype'},
        lualine_z = {'location'}
      },
      tabline = {
        lualine_a = {'buffers'}
      },
    }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
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
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local com = function(fname)
        return string.format("<cmd>lua require('telescope.builtin').%s()<CR>", fname)
      end
      return {
        { "<leader>fb", com("buffers"              ) },
        { "<leader>fg", com("live_grep"            ) },
        { "<leader>ff", com("find_files"           ) },
        { "<leader>fa", com("diagnostics"          ) },
        { "<leader>fc", com("command_history"      ) },
        { "<leader>fr", com("lsp_references"       ) },
        { "<leader>fd", com("lsp_definitions"      ) },
        { "<leader>fi", com("lsp_implementations"  ) },
        { "<leader>ft", com("lsp_type_definitions" ) },
        { "<leader>fs", com("lsp_document_symbols" ) },
        { "<leader>fS", com("lsp_workspace_symbols") },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    -- TODO: enable lazy load; load before opening an directory
    lazy = false,
    opts = {
      view = { relativenumber = true, adaptive_size = true }
    },
    keys = {
      { "<C-b>", "<cmd>NvimTreeToggle<CR>" },
    },
  },
  { "easymotion/vim-easymotion", event = "VeryLazy" },
  { "tpope/vim-surround",        event = "VeryLazy" },
  -- show abs line number only under insert mode
  { "myusuf3/numbers.vim",   event = "VeryLazy" },
  { "numToStr/Comment.nvim", event = "VeryLazy" },
}

