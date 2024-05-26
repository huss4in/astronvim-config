-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Pack
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.markdown" },

  -- Recipes
  { import = "astrocommunity.recipes.vscode" },

  -- Completion
  { import = "astrocommunity.completion.copilot-lua" },
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

  -- Bars and Lines
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "150",
      -- disabled_filetypes = { "help", "text", "markdown" },
      -- custom_colorcolumn = {},
      -- scope = "file",
    },
  },
}
