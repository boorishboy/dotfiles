return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- Configure LazyVim to load gruvbox
  require("tokyonight").setup({
    style = "night",
  }),
}
