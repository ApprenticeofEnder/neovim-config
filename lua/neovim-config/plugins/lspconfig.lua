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
  "clangd",
  "sqlls",
  "rust_analyzer",
  "jsonls",
  "nil_ls",
  "vue_ls",
}
local nvlsp = require "nvchad.configs.lspconfig"

local vue_language_server_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}
local ts_ls_config = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}

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

  vim.lsp.config("yamlls", {
    settings = {
      yaml = {
        schemas = {
          kubernetes = "k8s-*.yaml",
          ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
          ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
          ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
          ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
          ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
          ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
          ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
        },
      },
    },
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

  vim.lsp.config("vtsls", vtsls_config)
  vim.lsp.config("ts_ls", ts_ls_config)
  vim.lsp.enable { "ts_ls", "vue_ls" }
end

return {
  "neovim/nvim-lspconfig",
  config = ConfigureLsps,
}
