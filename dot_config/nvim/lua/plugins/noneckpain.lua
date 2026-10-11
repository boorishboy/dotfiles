return {
  "shortcuts/no-neck-pain.nvim",
  version = "*", -- Pin to release versions
  cmd = { "NoNeckPain" }, -- Lazy load on command
  keys = {
    -- Example keymap to toggle the plugin
    { "<leader>np", "<cmd>NoNeckPain<cr>", desc = "Toggle No Neck Pain" },
  },
  opts = {
    -- Place your custom configuration options here, for example:
    -- width = 120,
    -- buffers = {
    --   left = { protected = true },
    --   right = { protected = true },
    -- },
  },
}
