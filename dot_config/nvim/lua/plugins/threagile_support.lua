return {
  "L3MON4D3/LuaSnip",
  opts = function()
    require("luasnip").add_snippets("yaml", require("plugins.snippets.threagile"))
  end,
}
