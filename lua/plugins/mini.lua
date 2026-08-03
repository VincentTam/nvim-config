return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup()
  end,
}
