return {
  {
    "gbprod/substitute.nvim",
    lazy = false,
    config = function()
      require("substitute").setup {}

      local x = { noremap = true }

      -- Swap
      vim.keymap.set("n", "Xs", require("substitute").operator, x)
      vim.keymap.set("n", "Xss", require("substitute").line, x)
      vim.keymap.set("x", "Xs", require("substitute").visual, x)

      -- Exchange
      vim.keymap.set("n", "Xc", require("substitute.exchange").operator, x)
      vim.keymap.set("n", "Xcc", require("substitute.exchange").line, x)
      vim.keymap.set("x", "Xc", require("substitute.exchange").visual, x)
    end,
  },
}
