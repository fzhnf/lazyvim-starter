return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "pint",
      },
    },
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "fzhnf/flutter-bloc.nvim",
    lazy = true,
    ft = { "dart" },
    opts = {
      bloc_type = "default", -- Choose from: 'default', 'equatable', 'freezed'
      use_sealed_classes = false,
      enable_code_actions = true,
    },
  },
}
