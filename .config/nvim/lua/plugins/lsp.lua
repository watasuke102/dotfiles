-- based https://www.reddit.com/r/neovim/comments/1kq8jxb/just_wanted_to_share_this_little_config_snippet_i
vim.opt.updatetime = 1500 -- time until `CursorHold` fire
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float({ focusable = false, source = "if_many" })
    end,
})
-- based `:h lsp-attach`
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- completion
    if client:supports_method('textDocument/completion') then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, {
        autotrigger = true,
      })
    end
    -- auto formatting
    if not client:supports_method('textDocument/willSaveWaitUntil')
      and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({
            bufnr = args.buf,
            id = client.id,
            timeout_ms = 3000
          })
        end,
      })
    end
  end,
})

-- rust-analyzer should be managed by Rustup on system
vim.lsp.enable('rust_analyzer')

return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
    config = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    keys = {
      { "<C-space>", "<cmd>lua vim.lsp.completion.get()  <CR>", mode = "i" },
      { "gh",        "<cmd>lua vim.lsp.buf.hover()       <CR>" },
      { "gd",        "<cmd>lua vim.lsp.buf.definition()  <CR>" },
      { "gD",        "<cmd>lua vim.lsp.buf.declaration() <CR>" },
      --[
      -- Note: default mapping is as follows:
      --   * grn   => vim.lsp.buf.rename()
      --   * grr   => vim.lsp.buf.references()
      --   * gra   => vim.lsp.buf.code_action()
      --   * gra   => vim.lsp.buf.code_action()
      --   * gri   => vim.lsp.buf.implementation()
      --   * gO    => vim.lsp.buf.document_symbol()
      --   * <C-s> => vim.lsp.buf.signature_help()
      --]
    },
  },
  { "neovim/nvim-lspconfig" },
}

