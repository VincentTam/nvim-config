return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "cpp", "rust", "lua", "html", "css", "javascript", "markdown", "typst" },
    highlight = { enable = true },
    indent = { enable = true },
  }
}
