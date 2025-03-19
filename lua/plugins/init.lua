return {
  { "majutsushi/tagbar", lazy = false },
  { "ms-jpq/chadtree", branch = "chad", lazy = false },
  "rhysd/committia.vim",
  "tidalcycles/vim-tidal",
  "mg979/vim-visual-multi",

  { "inkarkat/vim-ingo-library", branch = "stable" },
  { "inkarkat/vim-mark", branch = "stable" },
  "lambdalisue/suda.vim",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "elihunter173/dirbuf.nvim",
  "b0o/schemastore.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "mhinz/vim-signify",

  -- language bundles
  "bfrg/vim-jq",
  -- "bfrg/vim-jqplay",
  "fladson/vim-kitty",

  -- Look and Feel
  "tanvirtin/monokai.nvim",
  "navarasu/onedark.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },
}
