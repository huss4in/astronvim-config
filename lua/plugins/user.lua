-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "marko-cerovac/material.nvim",
    lazy = false,
  },

  {
    "sitiom/nvim-numbertoggle",
    event = "BufRead",
  },

  {
    "tpope/vim-surround",
    event = "BufRead",
  },

  {
    "m-demare/hlargs.nvim",
    event = "BufRead",
    requires = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("hlargs").setup() end,
  },

  {
    "psliwka/vim-smoothie",
    lazy = false,
  },

  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },

  {
    "mg979/vim-visual-multi",
    event = "BufRead",
  },

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
