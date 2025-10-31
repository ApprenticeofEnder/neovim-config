if vim.g.vscode then
  -- VSCode neovim
  require "vscode-config.index"
else
  -- Ordinary neovim
  require "neovim-config.index"
end
