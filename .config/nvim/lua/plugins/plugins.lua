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
    keys = {
      { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()               <CR>" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()             <CR>" },
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()            <CR>" },
      { "<leader>fa", "<cmd>lua require('telescope.builtin').diagnostics()           <CR>" },
      { "<leader>fc", "<cmd>lua require('telescope.builtin').command_history()       <CR>" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()        <CR>" },
      { "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()       <CR>" },
      { "<leader>fi", "<cmd>lua require('telescope.builtin').lsp_implementations()   <CR>" },
      { "<leader>ft", "<cmd>lua require('telescope.builtin').lsp_type_definitions()  <CR>" },
      { "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()  <CR>" },
      { "<leader>fS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols() <CR>" },
    },
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

