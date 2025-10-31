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
  "jsonls",
  "jdtls",
}
local nvlsp = require "nvchad.configs.lspconfig"

function ConfigureLsps()
  require("nvchad.configs.lspconfig").defaults()

  -- lsps with default config
  for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    })
    vim.lsp.enable(lsp)
  end

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
  vim.lsp.enable "tinymist"

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
  vim.lsp.enable "pyright"

  vim.lsp.config("cssls", {
    settings = {
      css = {
        lint = { unknownAtRules = "ignore" },
      },
    },
  })
  vim.lsp.enable "cssls"
end

return {
  "neovim/nvim-lspconfig",
  config = ConfigureLsps,
}
