return {
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    event = "VeryLazy",
    init = function()
      local c = require("CopilotChat")
      vim.api.nvim_create_user_command("ChatHere", function()
        c.open({ window = { layout = "replace" } })
      end, {})
      vim.api.nvim_create_user_command("ChatPop", function()
        c.open({ window = {
          layout = "float",
          width = 0.9,
          height = 0.9,
        }})
      end, {})
      vim.api.nvim_create_user_command("ChatReset", c.reset, {})
    end,
  },
}

