---@diagnostic disable: need-check-nil
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      php = { "phpcs" },
    },
    linters = {
      phpcs = {
        prepend_args = {
          "--exclude=Generic.Commenting.DocComment,Generic.Files.LineLength,PEAR.Commenting.FileComment,PEAR.Commenting.ClassComment,PEAR.Commenting.FunctionComment",
        },
      },
    },
  },
}
