return {
  {
    "ray-x/go.nvim",
    config = function()
      require("go").setup({
        trouble = true
      })
      vim.g.tagbar_type_go = {
        ctagstype = "go",
        ctagsbin = "gotags",
        ctagsargs = "-sort -silent",
      }
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}
