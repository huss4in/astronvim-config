return {
  {
    "m-demare/hlargs.nvim",
    event = "BufRead",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("hlargs").setup() end,
  },
}
