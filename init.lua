local config = {
  colorscheme = "default_theme",
  -- Set dashboard header
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  header = {},
  mappings = {
    -- first key is the mode
    n = {
      -- DiffView
      ["<leader>do"] = { ":DiffviewOpen ", desc = "Show diff of two hashes of commits" },
      ["<leader>dh"] = { "<cmd>DiffviewFileHistory<cr>", desc = "Show history of commmits" },
      -- Tabs & buffers
      ["<leader>Bn"] = { "<cmd>tabnew<cr>", desc = "Open new tab" },
      ["<leader>Bc"] = { "<cmd>tabclose<cr>", desc = "Close current tab" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- Telescope
      ["<leader>fr"] = { "<cmd>Telescope resume<cr>", desc = "Resume last search in Telescope" },
      -- Replacing
      ["<leader>rr"] = { ":%s/<C-r>\"//gc<left><left><left>", desc = "Replace in current file with confirmation" },
      ["<leader>rR"] = { ":%s/<C-r>\"//g<left><left>", desc = "Replace in current file" },
    },
  },


  plugins = {
    init = {
      -- Git diff
      ["sindrets/diffview.nvim"] = { cmd = {"DiffviewOpen", "DiffviewFileHistory"},},
    },
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      local null_ls = require "null-ls"
      
      flake8 = null_ls.builtins.diagnostics.flake8
      if flake8 ~= nil  then flake8 = flake8.with({ extra_args = {"--max-line-length=120" } }) end
      
      config.sources = {
        null_ls.builtins.formatting.black.with({ extra_args = {"--fast", "--line-length=120" } }),
        flake8
      }
      return config
    end,
  },
  lsp = {
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
    },
  },
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      n = {
        ["<leader>"] = {
          ["d"] = { name = "DiffView" },
          ["b"] = { name = "Buffer" },
          ["B"] = { name = "Tabs" },
          ["r"] = { name = "Replacing" },
        },
      },
    },
  },
}

return config
