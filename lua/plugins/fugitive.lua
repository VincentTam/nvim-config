return {
  "tpope/vim-fugitive",
  dependencies = {
    "tpope/vim-rhubarb",
  },
  keys = {
    { "<leader>gx", [[<Cmd>G<CR>]], desc = "Toggle [G]it status window" },
    { "<leader>gs", [[<Cmd>Git<CR>]], desc = "Toggle [G]it [S]tatus window" },
    {
      "<leader>gfd",
      [[<Cmd>Gdiffsplit<CR>]],
      desc = "[G]it [D]iff current file against index with [F]ugitive",
    },
    { "<leader>gc", [[<Cmd>Git commit<CR>]], desc = "[G]it [C]ommit" },
    { "<leader>gb", [[<Cmd>Git blame -C<CR>]], desc = "[G]it [B]lame" },
    { "<leader>gp", [[<Cmd>Git push<CR>]], desc = "[G]it [P]ush" },
    { "<leader>gf", [[<Cmd>Git push --force<CR>]], desc = "[G]it [F]orce push" },
    { "<leader>gu", [[<Cmd>Git pull<CR>]], desc = "[G]it p[U]ll" },
    {
      "<leader>gh",
      [[<Cmd>Git diff --cached<CR>]],
      desc = "[G]it diff current staged changes",
    },
    {
      "<leader>go",
      "<Cmd>.GBrowse<CR>",
      desc = "[B]rowse [G]it URL for fugitive object under cursor",
    },
    {
      "<leader>go",
      ":GBrowse<CR>",
      mode = "v",
      desc = "[B]rowse [G]it URL for selected lines",
      silent = true,
    },
  },
}
