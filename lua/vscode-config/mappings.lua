local keymap = vim.keymap.set
local opts = { noremap = true }

local vscode = require "vscode"

local function opts_with_description(desc)
  return {
    unpack(opts),
    desc = desc,
  }
end

local function map_vscode(action)
  return function()
    vscode.action(action)
  end
end

keymap("i", "<C-b>", "<ESC>^i", opts_with_description "move beginning of line")
keymap("i", "<C-e>", "<End>", opts_with_description "move end of line")
keymap("i", "<C-h>", "<Left>", opts_with_description "move left")
keymap("i", "<C-l>", "<Right>", opts_with_description "move right")
keymap("i", "<C-j>", "<Down>", opts_with_description "move down")
keymap("i", "<C-k>", "<Up>", opts_with_description "move up")

keymap("n", "<C-h>", map_vscode "workbench.action.navigateLeft", opts_with_description "switch window left")
keymap("n", "<C-l>", map_vscode "workbench.action.navigateRight", opts_with_description "switch window right")
keymap("n", "<C-j>", map_vscode "workbench.action.navigateDown", opts_with_description "switch window down")
keymap("n", "<C-k>", map_vscode "workbench.action.navigateUp", opts_with_description "switch window up")

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
keymap("n", "gi", map_vscode "editor.action.goToImplementation", { desc = "Go to implementation" })

-- Go to references
keymap("n", "gr", map_vscode "editor.action.goToReferences", { desc = "Go to references" })

-- Go to definition
keymap("n", "gd", map_vscode "editor.action.revealDefinition", { desc = "Go to definition" })

-- to stage the selection context
keymap("v", "gs", map_vscode "git.stageSelectedRanges", { desc = "Stage selected lines" })

-- Toggle the terminal
keymap({ "n", "v" }, "<leader>t", map_vscode "workbench.action.terminal.toggleTerminal", { desc = "Toggle terminal" })

-- Run a task
keymap("n", "<leader>rt", map_vscode "workbench.action.tasks.runTask", { desc = "Run task" })

-- Toggle a breakpoint
keymap({ "n", "v" }, "<leader>b", map_vscode "editor.debug.action.toggleBreakpoint", { desc = "Toggle breakpoint" })

keymap({ "n", "v" }, "<leader>d", map_vscode "editor.action.showHover", { desc = "Show hover" })
keymap({ "n", "v" }, "<leader>a", map_vscode "editor.action.quickFix", { desc = "Quick fix" })
keymap({ "n", "v" }, "<leader>ds", map_vscode "workbench.actions.view.problems", { desc = "Show problems" })
keymap({ "n", "v" }, "<leader>cn", map_vscode "notifications.clearAll", { desc = "Clear notifications" })
keymap({ "n", "v" }, "<leader>ff", map_vscode "workbench.action.quickOpen", { desc = "Quick open" })
keymap({ "n", "v" }, "<leader>cp", map_vscode "workbench.action.showCommands", { desc = "Show commands" })
keymap({ "n", "v" }, "<leader>pr", map_vscode "code-runner.run", { desc = "Run code" })
keymap({ "n", "v" }, "<leader>fd", map_vscode "editor.action.formatDocument", { desc = "Format document" })

-- harpoon keymaps
keymap({ "n", "v" }, "<leader>ha", map_vscode "vscode-harpoon.addEditor", { desc = "Harpoon: Add editor" })
keymap({ "n", "v" }, "<leader>ho", map_vscode "vscode-harpoon.editorQuickPick", { desc = "Harpoon: Quick pick" })
keymap({ "n", "v" }, "<leader>he", map_vscode "vscode-harpoon.editEditors", { desc = "Harpoon: Edit editors" })
keymap({ "n", "v" }, "<leader>h1", map_vscode "vscode-harpoon.gotoEditor1", { desc = "Harpoon: Go to editor 1" })
keymap({ "n", "v" }, "<leader>h2", map_vscode "vscode-harpoon.gotoEditor2", { desc = "Harpoon: Go to editor 2" })
keymap({ "n", "v" }, "<leader>h3", map_vscode "vscode-harpoon.gotoEditor3", { desc = "Harpoon: Go to editor 3" })
keymap({ "n", "v" }, "<leader>h4", map_vscode "vscode-harpoon.gotoEditor4", { desc = "Harpoon: Go to editor 4" })
keymap({ "n", "v" }, "<leader>h5", map_vscode "vscode-harpoon.gotoEditor5", { desc = "Harpoon: Go to editor 5" })
keymap({ "n", "v" }, "<leader>h6", map_vscode "vscode-harpoon.gotoEditor6", { desc = "Harpoon: Go to editor 6" })
keymap({ "n", "v" }, "<leader>h7", map_vscode "vscode-harpoon.gotoEditor7", { desc = "Harpoon: Go to editor 7" })
keymap({ "n", "v" }, "<leader>h8", map_vscode "vscode-harpoon.gotoEditor8", { desc = "Harpoon: Go to editor 8" })
keymap({ "n", "v" }, "<leader>h9", map_vscode "vscode-harpoon.gotoEditor9", { desc = "Harpoon: Go to editor 9" })

-- project manager keymaps
keymap({ "n", "v" }, "<leader>pa", map_vscode "projectManager.saveProject", { desc = "Project: Save project" })
keymap({ "n", "v" }, "<leader>po", map_vscode "projectManager.listProjects", { desc = "Project: List projects" })
keymap(
  { "n", "v" },
  "<leader>pn",
  map_vscode "projectManager.listProjectsNewWindow",
  { desc = "Project: List projects (new window)" }
)
keymap({ "n", "v" }, "<leader>pe", map_vscode "projectManager.editProjects", { desc = "Project: Edit projects" })
