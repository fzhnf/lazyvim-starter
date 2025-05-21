-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

-- Enable this option to avoid "Biome" conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true

-- set to `true` to follow the main branch
-- you need to have a working rust toolchain to build the plugin
-- in this case.
vim.g.lazyvim_blink_main = false
