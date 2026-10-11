return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers.yamlls = opts.servers.yamlls or {}
    opts.servers.yamlls.settings = opts.servers.yamlls.settings or {}
    opts.servers.yamlls.settings.yaml = opts.servers.yamlls.settings.yaml or {}

    local yaml = opts.servers.yamlls.settings.yaml
    yaml.completion = true
    yaml.hover = true
    yaml.validate = true
    yaml.schemas = vim.tbl_deep_extend("force", yaml.schemas or {}, {
      [vim.fn.stdpath("config") .. "/lua/plugins/schemas/threagile.schema.json"] = {
        "threagile.txt",
        "threagile.yaml",
        "*.threagile",
      },
    })
  end,
}
