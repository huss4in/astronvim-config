---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.completion.copilot-lua" }, -- lua/community/copilot.lua
  {
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = "<C-k>",
          accept_line = "<C-j>",
          next = "<M-.>",
          prev = "<M-,>",
          dismiss = "<C-c>",
        },
      },
    },
  },
}
