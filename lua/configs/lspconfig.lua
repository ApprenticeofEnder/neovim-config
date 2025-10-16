-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "gopls",
  "ruff",
  "pyright",
  "marksman",
  "dockerls",
  "taplo",
  "ansiblels",
  "tinymist",
  "terraformls",
  "tailwindcss",
  "tflint",
  "yamlls",
  "svelte",
  "ts_ls",
  "clangd",
  "sqlls",
  "rust_analyzer",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format {
      async = false,
    }
  end,
})

vim.lsp.config("tinymist", {
  root_dir = function(filename, bufnr)
    return vim.fn.getcwd()
  end,
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "disable",
  },
})

vim.lsp.config("pyright", {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
})

vim.lsp.config("cssls", {
  settings = {
    css = {
      lint = { unknownAtRules = "ignore" },
    },
  },
})

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
