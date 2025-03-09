local options = {
  formatters_by_ft = {
    css = { "prettier" },
    html = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "ruff_fix", "ruff_format" },
    terraform = { "tflint" },
    typst = { "prettypst" },
    yaml = { "prettier" },
  },
  formatters = {
    prettypst = {
      command = "prettypst",
      args = { "--use-std-in", "--use-std-out" },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
