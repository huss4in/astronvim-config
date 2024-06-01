-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity", -- ~/.local/share/nvim/lazy/astrocommunity/lua/astrocommunity/

  -- HACK: bars-and-lines
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  -- NOTE: { import = "astrocommunity.bars-and-lines.statuscol-nvim" }, -- lua/community/statuscol.lua
  -- NOTE: { import = "astrocommunity.bars-and-lines.bufferline-nvim" }, -- lua/community/bufferline.lua
  -- NOTE: { import = "astrocommunity.bars-and-lines.vim-illuminate" }, -- lua/community/illuminate.lua

  -- HACK: code-runner
  { import = "astrocommunity.code-runner.compiler-nvim" },

  -- HACK: color
  { import = "astrocommunity.color.transparent-nvim" },

  -- HACK: colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },

  -- HACK comment

  -- HACK: completion
  -- NOTE: { import = "astrocommunity.completion.copilot-lua" }, -- lua/community/copilot.lua

  -- HACK debugging

  -- HACK diagnostics

  -- HACK editing-support

  -- HACK file-explorer

  -- HACK fuzzy-finder

  -- HACK game

  -- HACK git

  -- HACK indent

  -- HACK keybinding

  -- HACK lsp

  -- HACK markdown-and-latex

  -- HACK media

  -- HACK motion

  -- HACK note-taking

  -- HACK: pack
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
  -- NOTE: { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" }, -- lua/community/rainbow-delimiter-indent-blankline.lua

  -- HACK programming-language-support

  -- HACK project

  -- HACK: recipes
  { import = "astrocommunity.recipes.vscode" },
  -- NOTE: { import = "astrocommunity.recipes.heirline-nvchad-statusline" }, -- lua/community/heirline.lua

  -- HACK register

  -- HACK remote-development

  -- HACK scrolling

  -- HACK search

  -- HACK snippet

  -- HACK: split-and-window
  { import = "astrocommunity.split-and-window.mini-map" },

  -- HACK startup

  -- HACK syntax

  -- HACK terminal-integration

  -- HACK test

  -- HACK utility

  -- HACK workflow
}
