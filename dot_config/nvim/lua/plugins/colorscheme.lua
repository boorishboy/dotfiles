return {
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
      style = "night",
      transparent = true, -- To włącza przezroczystość dla tła
        styles = {
          sidebars = "transparent", -- Przezroczyste panele boczne (np. NvimTree)
          floats = "transparent",   -- Przezroczyste okna pływające (np. LSP, Lazy)
        },
    },
}}
