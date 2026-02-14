-- Helper: Checks if Fyler is open in the current tab and returns the window ID
local function get_fyler_win()
  return vim.iter(vim.api.nvim_tabpage_list_wins(0)):find(function(win)
    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "fyler"
  end)
end

return {
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        config = {
          os = {
            edit = 'test -z "$NVIM"; and nvim -- {{filename}}; or begin; nvim --server "$NVIM" --remote-send "q"; and nvim --server "$NVIM" --remote {{filename}}; end',
          },
        },
      },
    },
  },

  -- disable builtin lazyvim file tree in favor of fyler.nvim
  { "folke/snacks.nvim", opts = { explorer = { enabled = false } } },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  -- set bufferline offsets for fyler
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "fyler",
            text = "󰙅 Explorer",
            separator = true, -- Matches the sidebar border
          },
        },
      },
    },
  },
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    branch = "stable", -- Use stable branch for production
    lazy = false, -- Necessary for `default_explorer` to work properly
    keys = {
      {
        "<leader>fe",
        function()
          local win = get_fyler_win()
          if win and vim.api.nvim_win_is_valid(win) then
            -- If it exists, focus it
            vim.api.nvim_set_current_win(win)
          else
            -- If it doesn't exist, open it
            require("fyler").open({ dir = LazyVim.root() })
          end
        end,
        desc = "Focus or Open Fyler (Root)",
      },
      {
        "<leader>fE",
        function()
          local win = get_fyler_win()
          if win and vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_set_current_win(win)
          else
            require("fyler").open({ dir = vim.uv.cwd() })
          end
        end,
        desc = "Focus or Open Fyler (CWD)",
      },
      -- Alias keys to match your Neo-tree style
      { "<leader>e", "<leader>fe", desc = "Explorer Fyler (Root Dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer Fyler (cwd)", remap = true },
    },
    opts = {
      views = {
        finder = {
          close_on_select = false,
          -- Set default mode to "sidebar" style
          win = {
            kind = "split_left_most",
            -- set the window's Normal background to use the global NormalFloat group
            win_opts = {
              winhighlight = "Normal:NormalFloat,NormalNC:NormalFloat",
            },
          },
          mappings = {
            [" e"] = "CloseView",
            [" E"] = "CloseView",

            -- Copy Path (Y)
            ["Y"] = function(self)
              local node = self:cursor_node_entry()
              if node and node.path then
                vim.fn.setreg("+", node.path)
                vim.notify("Copied: " .. node.path)
              end
            end,

            -- Open with System App (O), default xdg-open
            ["O"] = function(self)
              local node = self:cursor_node_entry()
              if node and node.path then
                if vim.ui.open then
                  vim.ui.open(node.path)
                else
                  vim.cmd("!xdg-open " .. vim.fn.shellescape(node.path))
                end
              end
            end,
          },
        },
      },
    },
  },
}
