return {
  {
    "vyfor/cord.nvim",
    event = "BufRead",
    opts = {
      display = { theme = "minecraft", flavor = "accent" },
      buttons = {
        {
          label = "View Repository",
          url = function(opts)
            return opts.repo_url
          end,
        },
      },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    event = "BufRead",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disabled_filetypes = { fyler_finder = true },
      max_count = 10,
    },
  },
}
