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
        auto_start = true,
        xdg = true,
        clients = {
          lsp = { weight_adjust = 1.4 },
        },
      }
    end,
    config = function()
      local coq = require "coq"
      require'lspconfig'.gopls.setup{coq.lsp_ensure_capabilities{}}
      require'lspconfig'.vimls.setup{coq.lsp_ensure_capabilities{}}
      require'lspconfig'.bashls.setup{coq.lsp_ensure_capabilities{}}
      require'lspconfig'.taplo.setup{coq.lsp_ensure_capabilities{}}

      require "lspconfig".yamlls.setup {
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://json.schemastore.org/taskfile.json"] = "Taskfile.yml",
            },
          }
        },
        coq.lsp_ensure_capabilities{}
      }

      require'lspconfig'.tflint.setup{coq.lsp_ensure_capabilities{}}
      require'lspconfig'.terraformls.setup{coq.lsp_ensure_capabilities{}}
      vim.api.nvim_create_autocmd({"BufWritePre"}, {
        pattern = {"*.tf", "*.tfvars"},
        callback = function()
          vim.lsp.buf.format()
        end,
      })

    end, -- end config
  }
}
