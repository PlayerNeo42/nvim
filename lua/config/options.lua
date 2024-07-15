-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.scrolloff = 10
vim.opt.formatoptions = "jcrqlnt"
vim.wo.rnu = true

vim.api.nvim_create_user_command("GoAddTags", function(opts)
  require("gomodifytags").GoAddTags(opts.fargs[1], opts.args)
end, { nargs = "+" })

if vim.g.neovide then
  vim.g.neovide_transparency = 0.95
end
