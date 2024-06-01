---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.bars-and-lines.vim-illuminate" }, --lua/community/
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "150",
    },
  },
}
