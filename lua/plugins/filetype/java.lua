return {
  {
    "nvim-java/nvim-java",
    -- 2. run its setup once, before lspconfig starts jdtls
    config = function()
      require("java").setup() -- bridges nvim-java ↔ jdtls
    end,
    ft = { "java" },
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {},
          },
        },
      },
    },
  },
}
