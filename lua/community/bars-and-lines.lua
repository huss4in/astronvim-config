---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {

            n = {
              ["]b"] = { function() require("bufferline.commands").cycle(vim.v.count1) end, desc = "Next buffer" },
              ["[b"] = { function() require("bufferline.commands").cycle(-vim.v.count1) end, desc = "Previous buffer" },
              ["<M-l>"] = { function() require("bufferline.commands").cycle(vim.v.count1) end, desc = "Next buffer" },
              ["<M-h>"] = {
                function() require("bufferline.commands").cycle(-vim.v.count1) end,
                desc = "Previous buffer",
              },
              [">b"] = {
                function() require("bufferline.commands").move(vim.v.count1) end,
                desc = "Move buffer tab right",
              },
              ["<b"] = {
                function() require("bufferline.commands").move(-vim.v.count1) end,
                desc = "Move buffer tab left",
              },
            },
          },
        },
      },
    },
    event = "VeryLazy",
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },

  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "150",
    },
  },
}
