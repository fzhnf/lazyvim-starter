return {
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        },
      },
    },
    config = true,
  },
  {
    "fzhnf/flutter-bloc.nvim",
    ft = { "dart" },
    opts = {
      bloc_type = "equatable", -- Choose from: 'default', 'equatable', 'freezed'
      use_sealed_classes = true,
      enable_code_actions = true,
    },
  },
}
