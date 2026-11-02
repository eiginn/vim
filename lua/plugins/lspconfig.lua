local util = require 'lspconfig.util'

return {
  {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
      -- main one
      { "ms-jpq/coq_nvim", branch = "coq" },

      -- 9000+ Snippets
      { "ms-jpq/coq.artifacts", branch = "artifacts" },

      -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
      -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    init = function()
      vim.g.python3_host_prog = "/home/vaelen/.local/pyenv/versions/py3nvim/bin/python3"
      vim.g.coq_settings = {
        completion = {
          always = false,
          sticky_manual = true -- Trigger completion on every keystroke after manual completion until you leave insert mode
        },
        -- auto_start = 'shut-up',
        -- xdg = true,
        clients = {
          lsp = { weight_adjust = 1.4 },
        },
      }
    end,
    config = function()
      local coq = require "coq"
      vim.lsp.enable('gopls')
      vim.lsp.enable('vimls')
      vim.lsp.enable('bashls')
      vim.lsp.enable('systemd_lsp')

      vim.lsp.config('taplo', {
        -- required for loose toml files not in a project structure
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          on_dir(util.root_pattern('*.toml')(fname))
        end,
      })
      vim.lsp.enable('taplo')

      vim.lsp.config('yamlls', {
        settings = {
          yaml = {
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
            schemas = require('schemastore').yaml.schemas(),
            validate = { enable = true },
          }
        },
      })
      vim.lsp.enable('yamlls')

      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })
      vim.lsp.enable('jsonls')

      -- vim.lsp.config('pylsp', {
      --   settings = {
      --     pylsp = {
      --       plugins = {
      --         pycodestyle = {
      --           maxLineLength = 120,
      --         }
      --       }
      --     }
      --   }
      -- })
      -- vim.lsp.enable('pylsp')

      vim.lsp.config('ruff', {
        init_options = {
          settings = {
            lineLength = 120
          }
        }
      })
      vim.lsp.enable('ruff')

      vim.lsp.enable('tflint')
      vim.lsp.enable('terraformls')
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format()
        end,
      })

    end, -- end config
  }
}
