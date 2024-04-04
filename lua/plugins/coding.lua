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
      opts.completion.completeopt = "menu,menuone,noinsert,noselect"
      opts.mapping["<Tab>"] = cmp.mapping.confirm({ select = true })
      opts.mapping["<CR>"] = function(fallback)
        if cmp.get_active_entry() then
          cmp.confirm({ select = false })
        else
          fallback()
        end
      end
      opts.mapping["<Esc>"] = function(fallback)
        if cmp.get_active_entry() then
          cmp.close()
        else
          fallback()
        end
      end
      opts.mapping["<C-Cr>"] = function(fallback)
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
