-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
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

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "  ██████╗ ██████╗ ███████╗██╗   ██╗                ",
            " ██╔════╝ ██╔══██╗██╔════╝╚██╗ ██╔╝                ",
            " ██║  ███╗██████╔╝█████╗   ╚████╔╝                 ",
            " ██║   ██║██╔══██╗██╔══╝    ╚██╔╝                  ",
            " ╚██████╔╝██║  ██║███████╗   ██║                   ",
            "  ╚═════╝ ╚═╝  ╚═╝╚══════╝   ╚═╝                   ",
            "                                                    ",
            " ██╗    ██╗ ██████╗ ██╗    ██╗   ██╗███████╗███████╗",
            " ██║    ██║██╔═══██╗██║    ██║   ██║██╔════╝██╔════╝",
            " ██║ █╗ ██║██║   ██║██║    ██║   ██║█████╗  ███████╗",
            " ██║███╗██║██║   ██║██║    ╚██╗ ██╔╝██╔══╝  ╚════██║",
            " ╚███╔███╔╝╚██████╔╝███████╗╚████╔╝ ███████╗███████║",
            "  ╚══╝╚══╝  ╚═════╝ ╚══════╝ ╚═══╝  ╚══════╝╚══════╝",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- Configure Neo-tree to show hidden files by default
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files
          hide_dotfiles = false, -- Don't hide dotfiles
          hide_gitignored = true, -- Optionally show gitignored files too
        },
      },
    },
  },

  -- Configure toggleterm with double ESC to exit
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Add double ESC keymapping to exit terminal mode
      vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end,
  },

  -- Claude Code integration
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      require("claudecode").setup {
        -- The plugin will automatically detect Claude Code CLI installation
      }
    end,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", desc = "Send to Claude", mode = "v" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ar", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
      { "<leader>at", "<cmd>ClaudeCodeToggle<cr>", desc = "Toggle Claude terminal" },
    },
  },

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
}
