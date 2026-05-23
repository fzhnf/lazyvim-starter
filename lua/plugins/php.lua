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
}
