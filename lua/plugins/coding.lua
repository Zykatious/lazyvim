return {
  "nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.completion.completeopt = "menu,menuone,noinsert,noselect"
    opts.mapping["<CR>"] = cmp.mapping.confirm({ select = false })
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
  end,
}
