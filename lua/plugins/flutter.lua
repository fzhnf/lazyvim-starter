return {
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
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
