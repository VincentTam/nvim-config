vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", "<cmd>Oil<CR>", { desc = "Open Oil (Directory)" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
local function toggle_loclist()
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.loclist == 1 then
      vim.cmd("lclose")
      return
    end
  end
  vim.diagnostic.setloclist()
end
vim.keymap.set("n", "<leader>q", toggle_loclist, { desc = "Toggle diagnostics loclist" })

vim.api.nvim_set_keymap(
  "n",
  "<leader>ahk",
  [[:lua vim.fn.jobstart({'C:/Program Files/AutoHotkey/v2/AutoHotkey.exe', vim.fn.expand('%:p')}, {detach = true})<CR>]],
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>h", function()
  vim.v.hlsearch = vim.v.hlsearch ~= 1
  vim.notify("hlsearch: " .. (vim.v.hlsearch == 1 and "on" or "off"))
end, { desc = "Toggle search highlighting" })
