return {
  {
    -- Add the blade-nav.nvim plugin which provides Goto File capabilities
    -- for Blade files.
    "ricardoramirezr/blade-nav.nvim",
    ft = { "blade", "php" },
    opts = {
      -- Completion/integration sources
      integrations = {
        gf = true,
        cmp = false,
        blink = true,
        coq = true,
        health = true,
      },
    },
  },
  -- add pint in addition to lazyvim's php extras
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pint",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint", "php_cs_fixer", stop_after_first = true },
      },
    },
  },
  {
    -- Remove phpcs linter.
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = {},
      },
    },
  },
}
