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
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
