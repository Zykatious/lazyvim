return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      f = require("cmp_nvim_lsp")
      f = require("cmp_buffer")
      opts.completion.completeopt = "menu,menuone,noinsert"
      opts.mapping["<Tab>"] = cmp.mapping.confirm({ select = true })
      opts.mapping["<CR>"] = function(fallback)
        fallback()
      end
      opts.mapping["<Esc>"] = function(fallback)
        if cmp.visible() then
          cmp.close()
        else
          fallback()
        end
      end
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
