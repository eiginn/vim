return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = "*",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "dockerfile",
                             "python", "hcl", "terraform", "devicetree",
                             "uxntal", "bash", "dot",
                             "go", "gowork", "gomod", "gosum", "sql", "gotmpl", "json", "comment" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  -- {
  --   "apple/pkl-neovim",
  --   lazy = true,
  --   ft = "pkl",
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "L3MON4D3/LuaSnip" },
  --   build = function()
  --     require('pkl-neovim').init()
  --     -- Set up syntax highlighting.
  --     vim.cmd("TSInstall! pkl")
  --   end,
  --   config = function()
  --     -- Set up snippets.
  --     require("luasnip.loaders.from_snipmate").lazy_load()
  --   end,
  -- },
}
