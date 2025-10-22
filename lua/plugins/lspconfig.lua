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
        auto_start = 'shut-up',
        xdg = true,
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
      vim.lsp.enable('taplo')

      vim.lsp.enable('yamlls')
      vim.lsp.config('yamlls', {
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://json.schemastore.org/taskfile.json"] = "Taskfile.yml",
            },
          }
        },
      })

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
