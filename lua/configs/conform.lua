local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    typst = { "prettypst" },
    python = { "ruff_fix", "ruff_format" },
    terraform = { "tflint" },
    markdown = { "prettier" },
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
