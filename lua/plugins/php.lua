return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Before (old syntax):
        -- php = { { "pint", "php_cs_fixer" } },

        -- After (new syntax):
        php = { "pint", "php_cs_fixer", stop_after_first = true },
      },
    },
  },
  {
    -- Remove phpcs linter.
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
  {
    -- Add the blade-nav.nvim plugin which provides Goto File capabilities
    -- for Blade files.
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    ft = { "blade", "php" },
  },
}
