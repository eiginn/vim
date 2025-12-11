return {
  { "majutsushi/tagbar", lazy = false },
  { "ms-jpq/chadtree", branch = "chad", lazy = false },
  "rhysd/committia.vim",
  "tidalcycles/vim-tidal",
  "mg979/vim-visual-multi",
  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },

  { "inkarkat/vim-ingo-library", branch = "stable" },
  {
    "inkarkat/vim-mark",
    branch = "stable",
    init = function()
      vim.g.mw_no_mappings = 1
    end
  },
  "lambdalisue/suda.vim",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "elihunter173/dirbuf.nvim",
  "b0o/schemastore.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "mhinz/vim-signify",
  "nfnty/vim-nftables",

  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    }
  },

  -- language bundles
  "bfrg/vim-jq",
  -- "bfrg/vim-jqplay",
  "fladson/vim-kitty",
  {
    "luizribeiro/vim-cooklang",
    ft = "cook",
  },

  -- Look and Feel
  "tanvirtin/monokai.nvim",
  "navarasu/onedark.nvim",
  {
    "folke/tokyonight.nvim",
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   -- load the colorscheme here
    --   vim.cmd([[colorscheme tokyonight-moon]])
    -- end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').load()
    end
  },
}
