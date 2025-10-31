if vim.g.vscode then
  -- VSCode neovim
  require "user.vscode_keymaps"
  vim.opt.clipboard = "unnamedplus"
  vim.opt.whichwrap:append "<>[]hl"
else
  -- Ordinary neovim
  require "neovim-config.index"
end
