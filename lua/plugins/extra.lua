return {
  {
    "vyfor/cord.nvim",
    event = "BufRead",
    ---@type CordConfig
    opts = {
      display = {
        theme = "minecraft",
        flavor = "accent",
      },
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
}
