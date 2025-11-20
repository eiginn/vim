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
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
         require('go.format').gofmt()
        end,
        group = format_sync_grp,
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  }
}
