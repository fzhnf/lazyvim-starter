return {
  {
    "vyfor/cord.nvim",
    event = "VeryLazy",
    build = ":Cord update",
    opts = {
      display = {
        flavor = "accent",
        theme = "catppuccin",
      },
    },
  },
}
