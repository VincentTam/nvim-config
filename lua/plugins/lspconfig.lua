return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tinymist",   -- Typst
          "clangd",     -- C & C++
          "ts_ls",      -- JS/TS
          "html",       -- HTML
          "cssls",      -- CSS
          "marksman",   -- Markdown
        }
      })

      -- Typst
      vim.lsp.config('tinymist', {
        -- Porting the "opt" from official docs here:
        settings = {
          semanticTokens = "enable",
        }
      })
      vim.lsp.enable('tinymist')

      -- C & C++
      vim.lsp.config('clangd', {})
      vim.lsp.enable('clangd')

      -- JS/TS
      vim.lsp.config('ts_ls', {})
      vim.lsp.enable('ts_ls')

      -- HTML
      vim.lsp.config('html', {})
      vim.lsp.enable('html')

      -- CSS
      vim.lsp.config('cssls', {})
      vim.lsp.enable('cssls')

      -- Markdown
      vim.lsp.config('marksman', {})
      vim.lsp.enable('marksman')
    end,
  }
}
