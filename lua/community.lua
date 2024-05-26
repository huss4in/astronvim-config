-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- HACK: Coorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.vscode-nvim" },

  -- HACK: Diagnostics
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    -- config = function() require("lsp_lines").toggle() end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          diagnostics = {
            virtual_text = false,
          },
          mappings = {
            n = {
              ["<Leader>uD"] = {
                function() require("lsp_lines").toggle() end,
                desc = "Toggle virtual diagnostic lines",
              },
            },
          },
        },
      },
    },
    opts = {},
  },

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

  -- HACK: Bars and Lines
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "150",
      -- disabled_filetypes = { "help", "text", "markdown" },
    },
  },

  -- HACK: Recipes
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- add new user interface icon
      icons = {
        VimIcon = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "",
        GitChange = "",
        GitDelete = "",
      },

      -- modify variables used by heirline but not defined in the setup call directly
      status = {
        -- define the separators between each section
        separators = {
          left = { "", "" }, -- separator for the left side of the statusline
          right = { " ", "" }, -- separator for the right side of the statusline
          tab = { "", "" },
        },
        -- add new colors that can be used by heirline
        colors = function(hl)
          local get_hlgroup = require("astroui").get_hlgroup
          -- use helper function to get highlight group properties
          hl.git_branch_fg = "green"
          hl.git_added = "lightgreen"
          hl.git_changed = "darkyellow"
          hl.git_removed = "lightred"
          hl.blank_bg = get_hlgroup("Folded").fg
          hl.file_info_bg = get_hlgroup("Visual").bg
          hl.nav_icon_bg = get_hlgroup("String").fg
          hl.nav_fg = hl.nav_icon_bg
          hl.folder_icon_bg = get_hlgroup("Error").fg
          hl.buffer_bg = get_hlgroup("Normal").bg
          hl.buffer_active_bg = get_hlgroup("WinBarNC").bg
          return hl
        end,
        attributes = {
          mode = { bold = true },
        },
        icon_highlights = {
          file_icon = {
            statusline = true,
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },

        status.component.mode {
          mode_text = { icon = { kind = "VimIcon", padding = { right = 1, left = 1 } } },
          padding = { right = 1 },
          surround = {
            color = function() return { main = status.hl.mode_bg(), right = "#1F2233" } end,
          },
        },

        status.component.file_info {
          filename = { fallback = "Empty" },
          filetype = false,
          file_read_only = false,
          padding = { left = 1, right = 1 },
          surround = {
            separator = "left",
            condition = false,
            color = "#1F2233",
          },
        },

        status.component.git_branch {
          git_branch = { padding = { left = 2 } },
          surround = { separator = "none" },
        },

        status.component.git_diff {
          padding = { left = 1 },
          surround = { separator = "none" },
        },

        status.component.fill(),
        status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
        status.component.fill(),

        status.component.cmd_info { padding = { right = 0, left = 0 } },
        status.component.diagnostics { surround = { separator = "right" } },
        status.component.lsp { lsp_progress = false, padding = { left = 0, right = 0 } },
        status.component.treesitter { padding = { right = 1 } },

        -- NvChad has some nice icons to go along with information, so we can create a parent component to do this
        -- all of the children of this table will be treated together as a single component
        {
          -- define a simple component where the provider is just a folder icon
          status.component.builder {
            -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
            { provider = require("astroui").get_icon "FolderClosed" },
            -- add padding after icon
            padding = { right = 1 },
            -- set the foreground color to be used for the icon
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            surround = { separator = "right", color = "folder_icon_bg" },
          },
          -- add a file information component and only show the current working directory name
          status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = {
              fname = function(nr) return vim.fn.getcwd(nr) end,
              padding = { left = 1 },
            },
            -- disable all other elements of the file_info component
            filetype = false,
            file_icon = { padding = { right = 0, left = 1 } },
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = {
              separator = "none",
              color = "#1F2233",
              condition = false,
            },
          },
        },

        {
          status.component.builder {
            { provider = require("astroui").get_icon "ScrollText" },
            padding = { right = 1 },
            hl = { fg = "bg" },
            surround = { separator = "right", color = { main = "nav_icon_bg", left = "#1F2233" } },
          },
          status.component.nav {
            percentage = {},
            ruler = { padding = { left = 1 } },
            scrollbar = {},
            surround = { separator = "none", color = "#1F2233" },
          },
        },
      }
    end,
  },
}
