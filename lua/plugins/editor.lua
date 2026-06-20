return {
  {
    "folke/snacks.nvim",
    ---@class snacks.Config
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

  -- set bufferline offsets for fyler
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "fyler_finder",
            text = "󰙅 Explorer",
            separator = true,
          },
        },
      },
    },
  },

  -- -- disable builtin lazyvim file tree in favor of fyler.nvim
  { "folke/snacks.nvim", opts = { explorer = { enabled = false } } },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "FylerOrg/fyler.nvim",
    keys = function()
      ---@param root string|nil
      ---@return fun()
      local function fyler_toggle(root)
        return function()
          local finder = require("fyler.finder")
          local inst = finder.instance_get_or_nil()
          if not inst then
            require("fyler").open({ root_path = root })
          elseif inst.win_id == vim.api.nvim_get_current_win() then
            require("fyler").close()
          else
            vim.api.nvim_set_current_win(inst.win_id)
          end
        end
      end

      return {
        {
          "<leader>e",
          fyler_toggle(LazyVim.root()),
          desc = "Explorer Fyler (Root Dir)",
        },
        {
          "<leader>E",
          fyler_toggle(vim.uv.cwd()),
          desc = "Explorer Fyler (cwd)",
        },
      }
    end,
    ---@class fyler.Config
    opts = {
      integrations = { icon = "mini_icons" },
      use_as_default_explorer = true,
      kind = "split_right_most",
      kind_presets = { split_right_most = { width = "20%" } },
      win_opts = { winhighlight = "Normal:NormalFloat,NormalNC:NormalFloat" },
      extensions = {
        trash = { enabled = true },
        git = { enabled = true },
      },
      mappings = {
        n = {
          ["<leader>e"] = { action = "close" },
          ["<leader>E"] = { action = "close" },
          ["s"] = { action = "select", args = { vsplit = true } },
          ["S"] = { action = "select", args = { split = true } },
          ["-"] = { action = "visit", args = { parent = true } },

          -- Copy Path (Y)
          ["Y"] = {
            action = function(self)
              local node = require("fyler.finder").parse_cursor_line(self)
              if node and node.full_path then
                vim.fn.setreg("+", node.full_path)
                vim.notify("Copied: " .. node.full_path)
              end
            end,
          },

          -- Open with System App (O), default xdg-open
          ["O"] = {
            action = function(self)
              local node = require("fyler.finder").parse_cursor_line(self)
              if node and node.full_path then
                if vim.ui.open then
                  vim.ui.open(node.full_path)
                else
                  vim.cmd("!xdg-open " .. vim.fn.shellescape(node.full_path))
                end
              end
            end,
          },
        },
      },
    },
  },
}
