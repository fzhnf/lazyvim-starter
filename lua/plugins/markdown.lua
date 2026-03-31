return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          stdin = false,
          args = {
            "--config",
            vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml",
            "--",
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          stdin = false,
          args = {
            "--config",
            vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml",
            "--",
          },
          parser = require("lint.parser").from_errorformat("%f:%l:%c %m,%f:%l %m", {
            source = "markdownlint",
            severity = vim.diagnostic.severity.WARN,
          }),
        },
      },
    },
  },
}
