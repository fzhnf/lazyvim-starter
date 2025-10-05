return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add parsers to install list
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "php",
      })

      return opts
    end,
    init = function()
      -- Register filetype detection (runs before plugin loads)
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      -- Register blade to use php parser
      vim.treesitter.language.register("php", "blade")
    end,
  },
}
