-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- HACK: Bars and Lines
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "150",
    },
  },

  -- HACK: Coorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  --
  -- HACK: Color
  { import = "astrocommunity.color.transparent-nvim" },

  -- HACK: Diagnostics

  -- HACK: Pack
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    opts = function(_, opts)
      if not opts.scope then opts.scope = {} end
      opts.scope.show_start = false
      opts.scope.show_end = false
      opts.scope.highlight = vim.tbl_get(vim.g, "rainbow_delimiters", "highlight")
        or {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        }
    end,

    config = function(plugin, opts)
      require(plugin.main).setup(opts)

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  -- HACK: Completion
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

  -- HACK: Split and Window
  { import = "astrocommunity.split-and-window.mini-map" },

  -- HACK: Recipes
  { import = "astrocommunity.recipes.vscode" },
}
