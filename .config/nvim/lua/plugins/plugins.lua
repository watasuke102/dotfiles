return {
  {
    "navarasu/onedark.nvim",
    dependencies = {
      "vim-airline/vim-airline-themes",
      "ryanoasis/vim-devicons", 
    },
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
    "vim-airline/vim-airline",
    lazy     = false,
    priority = 980,
    config = function()
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g.airline_powerline_fonts = 1
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local hl = { "CursorColumn", "Whitespace" }
      opts = {
        indent = { highlight = hl, char = "" },
        whitespace = {
          highlight = hl,
          remove_blankline_trail = false,
        },
      }
      return require("ibl").setup(opt)
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handle = { blend = 0 },
    }
  },
  { -- fuzzy finder
    "nvim-telescope/telescope.nvim", 
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()      <CR>" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()       <CR>" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()         <CR>" },
      { "<leader>fc", "<cmd>lua require('telescope.builtin').command_history() <CR>" },
    },
  },
  { "easymotion/vim-easymotion" },
  { "tpope/vim-surround" },
  { "myusuf3/numbers.vim" }, -- show abs line number only under insert mode
  { "numToStr/Comment.nvim" },
}

