local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local vscode = require "vscode"

local function opts_with_description(desc)
  return {
    unpack(opts),
    desc = desc,
  }
end

keymap("i", "<C-b>", "<ESC>^i", opts_with_description "move beginning of line")
keymap("i", "<C-e>", "<End>", opts_with_description "move end of line")

keymap("n", "<Esc>", "<cmd>noh<CR>", opts_with_description "general clear highlights")

keymap("n", "<C-s>", "<cmd>w<CR>", opts_with_description "general save file")
keymap("n", "<C-c>", "<cmd>%y+<CR>", opts_with_description "general copy whole file")

keymap("n", ";", ":", opts_with_description "CMD enter command mode")
keymap("i", "jk", "<ESC>", opts)

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -- yank to system clipboard
-- keymap({ "n", "v" }, "<leader>y", '"+y', opts)
--
-- -- paste from system clipboard
-- keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
-- keymap("v", "J", ":m .+1<CR>==", opts)
-- keymap("v", "K", ":m .-2<CR>==", opts)
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- call vscode commands from neovim

-- Toggle and Focus file explorer
keymap({ "n" }, "<leader>e", function()
  vscode.action "workbench.view.explorer"
  vscode.action "workbench.files.action.focusFilesExplorer"
end, { desc = "Toggle and focus file explorer" })

-- Go to implementation
keymap("n", "gi", function()
  vscode.action "editor.action.goToImplementation"
end, { desc = "Go to implementation" })

-- Go to references
keymap("n", "gr", function()
  vscode.action "editor.action.goToReferences"
end, { desc = "Go to references" })

-- Go to definition
keymap("n", "gd", function()
  vscode.action "editor.action.revealDefinition"
end, { desc = "Go to definition" })

-- to stage the selection context
keymap("v", "gs", function()
  vscode.action "git.stageSelectedRanges"
end, { desc = "Stage selected lines" })

-- Toggle the terminal
keymap({ "n", "v" }, "<leader>t", function()
  vscode.action "workbench.action.terminal.toggleTerminal"
end, { desc = "Toggle terminal" })

keymap("n", "<leader>rt", function()
  vscode.action "workbench.action.tasks.runTask"
end, { desc = "Run task" })

keymap({ "n", "v" }, "<leader>b", function()
  vscode.action "editor.debug.action.toggleBreakpoint"
end, { desc = "Toggle breakpoint" })

keymap({ "n", "v" }, "<leader>d", function()
  vscode.action "editor.action.showHover"
end, { desc = "Show hover" })

keymap({ "n", "v" }, "<leader>a", function()
  vscode.action "editor.action.quickFix"
end, { desc = "Quick fix" })

keymap({ "n", "v" }, "<leader>sp", function()
  vscode.action "workbench.actions.view.problems"
end, { desc = "Show problems" })

keymap({ "n", "v" }, "<leader>cn", function()
  vscode.action "notifications.clearAll"
end, { desc = "Clear notifications" })

keymap({ "n", "v" }, "<leader>ff", function()
  vscode.action "workbench.action.quickOpen"
end, { desc = "Quick open" })

keymap({ "n", "v" }, "<leader>cp", function()
  vscode.action "workbench.action.showCommands"
end, { desc = "Show commands" })

keymap({ "n", "v" }, "<leader>pr", function()
  vscode.action "code-runner.run"
end, { desc = "Run code" })

keymap({ "n", "v" }, "<leader>fd", function()
  vscode.action "editor.action.formatDocument"
end, { desc = "Format document" })

-- harpoon keymaps

keymap({ "n", "v" }, "<leader>ha", function()
  vscode.action "vscode-harpoon.addEditor"
end, { desc = "Harpoon: Add editor" })

keymap({ "n", "v" }, "<leader>ho", function()
  vscode.action "vscode-harpoon.editorQuickPick"
end, { desc = "Harpoon: Quick pick" })

keymap({ "n", "v" }, "<leader>he", function()
  vscode.action "vscode-harpoon.editEditors"
end, { desc = "Harpoon: Edit editors" })

keymap({ "n", "v" }, "<leader>h1", function()
  vscode.action "vscode-harpoon.gotoEditor1"
end, { desc = "Harpoon: Go to editor 1" })

keymap({ "n", "v" }, "<leader>h2", function()
  vscode.action "vscode-harpoon.gotoEditor2"
end, { desc = "Harpoon: Go to editor 2" })

keymap({ "n", "v" }, "<leader>h3", function()
  vscode.action "vscode-harpoon.gotoEditor3"
end, { desc = "Harpoon: Go to editor 3" })

keymap({ "n", "v" }, "<leader>h4", function()
  vscode.action "vscode-harpoon.gotoEditor4"
end, { desc = "Harpoon: Go to editor 4" })

keymap({ "n", "v" }, "<leader>h5", function()
  vscode.action "vscode-harpoon.gotoEditor5"
end, { desc = "Harpoon: Go to editor 5" })

keymap({ "n", "v" }, "<leader>h6", function()
  vscode.action "vscode-harpoon.gotoEditor6"
end, { desc = "Harpoon: Go to editor 6" })

keymap({ "n", "v" }, "<leader>h7", function()
  vscode.action "vscode-harpoon.gotoEditor7"
end, { desc = "Harpoon: Go to editor 7" })

keymap({ "n", "v" }, "<leader>h8", function()
  vscode.action "vscode-harpoon.gotoEditor8"
end, { desc = "Harpoon: Go to editor 8" })

keymap({ "n", "v" }, "<leader>h9", function()
  vscode.action "vscode-harpoon.gotoEditor9"
end, { desc = "Harpoon: Go to editor 9" })

-- project manager keymaps
keymap({ "n", "v" }, "<leader>pa", function()
  vscode.action "projectManager.saveProject"
end, { desc = "Project: Save project" })

keymap({ "n", "v" }, "<leader>po", function()
  vscode.action "projectManager.listProjects"
end, { desc = "Project: List projects" })

keymap({ "n", "v" }, "<leader>pn", function()
  vscode.action "projectManager.listProjectsNewWindow"
end, { desc = "Project: List projects (new window)" })

keymap({ "n", "v" }, "<leader>pe", function()
  vscode.action "projectManager.editProjects"
end, { desc = "Project: Edit projects" })
