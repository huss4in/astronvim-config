-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        clipboard = "",
        confirm = true,
        scrolloff = 5,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- ["<M-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- ["<M-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        ["L"] = { "$", desc = "$" },
        ["H"] = { "^", desc = "^" },

        ["<A-j>"] = { ":m .+1<cr>==", desc = "Move line up" },
        ["<A-k>"] = { ":m .-2<cr>==", desc = "Move line down" },

        ["<Leader>y"] = { '"+y', desc = "Yank to clipboard" },
        ["<Leader>D"] = { '"_d', desc = "Delete to void" },

        ["<Leader>/"] = false,
        ["<Leader>C"] = false,
        ["<Leader>bc"] = false,
        ["<Leader>bC"] = false,
        ["<Leader>bd"] = false,

        ["<Leader>c"] = { desc = " Close" },
        ["<Leader>cc"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
        ["<Leader>cC"] = { function() require("astrocore.buffer").close(0, true) end, desc = "Force Close buffer" },
        ["<Leader>ca"] = { function() require("astrocore.buffer").close_all() end, desc = "All buffers" },
        ["<Leader>co"] = { function() require("astrocore.buffer").close_all(true) end, desc = "Other buffers" },

        ['<Leader>f"'] = {
          ":Telescope registers<cr>",
          desc = "Find registers",
        },
      },
      i = {
        ["<A-k>"] = { "<esc>:m .-2<cr>==gi", desc = "Move line down" },
        ["<A-j>"] = { "<esc>:m .+1<cr>==gi", desc = "Move line up" },
      },
      v = {
        ["L"] = { "$", desc = "$" },
        ["H"] = { "^", desc = "^" },

        ["<Leader>y"] = { '"+y', desc = "Yank to clipboard" },
        ["D"] = { '"_d', desc = "Delete to void" },

        [">"] = { ">gv" },
        ["<"] = { "<gv" },

        ["<S-j>"] = { "j" },
        ["<S-k>"] = { "k" },
        ["<A-j>"] = { ":m '>+1<cr><esc>gv=gv", desc = "Move line up" },
        ["<A-k>"] = { ":m '<-2<cr><esc>gv=gv", desc = "Move line down" },
      },
    },
  },
}
