-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("n", "<Leader>d", '"_d', default_opts)
keymap("x", "<Leader>d", '"_d', default_opts)

-- Notes configuration
local notes = vim.fn.expand("~/notes")

-- Open today's journal
vim.keymap.set("n", "<leader>nd", function()
  local file = notes .. "/daily/" .. os.date("%Y-%m-%d") .. ".md"

  vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
  vim.cmd.edit(vim.fn.fnameescape(file))
end, { desc = "Notes: Today" })

-- Open inbox
vim.keymap.set("n", "<leader>ni", function()
  vim.cmd.edit(vim.fn.fnameescape(notes .. "/inbox.md"))
end, { desc = "Notes: Inbox" })

-- Find notes using Snacks
vim.keymap.set("n", "<leader>nf", function()
  Snacks.picker.files({
    cwd = notes,
  })
end, { desc = "Notes: Find" })

-- Search notes using Snacks
vim.keymap.set("n", "<leader>ns", function()
  Snacks.picker.grep({
    cwd = notes,
  })
end, { desc = "Notes: Search" })
