vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
callback = function()
  require('nvim-treesitter.parsers').tmux = {
    install_info = {
      url = 'https://github.com/Freed-Wu/tree-sitter-tmux',
      -- optional entries:
      branch = 'main', -- only needed if different from default branch
      generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
      generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
      queries = 'queries', -- also install queries from given directory
    },
  }
end})


return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    init = function()
      require('nvim-treesitter').install { 
        "c", "lua", "vim", "vimdoc", "dockerfile",
        "python", "hcl", "terraform", "devicetree",
        "uxntal", "bash", "dot", "html", "yaml",
        "go", "gowork", "gomod", "gosum", "sql",
        "gotmpl", "json", "comment", "nginx", "udev",
        "tmux", "strace" }
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
