return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        configure = true,
        config = {
          os = {
            editPreset = "nvim-remote",
            edit = 'bash -c \'if [ -z "$NVIM" ]; then nvim -- {{filename}}; else nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}}; fi\'',
            editAtLine = 'bash -c \'if [ -z "$NVIM" ]; then nvim +{{line}} -- {{filename}}; else nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}} && nvim --server "$NVIM" --remote-send ":{{line}}<CR>"; fi\'',
            editAtLineAndWait = "bash -c 'nvim +{{line}} {{filename}}'",
            openDirInEditor = 'bash -c \'if [ -z "$NVIM" ]; then nvim -- {{dir}}; else nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{dir}}; fi\'',
          },
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      window = {
        mappings = {
          [" e"] = "close_window",
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },
          ["P"] = { "toggle_preview", config = { use_float = false } },
        },
      },
    },
  },
}
