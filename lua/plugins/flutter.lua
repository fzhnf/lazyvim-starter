return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = true,
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
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
