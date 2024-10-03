-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      disable = { "gitcommit" },
    },
    ensure_installed = {
      "lua",
      "vim",
      "html",
      "gotmpl",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
