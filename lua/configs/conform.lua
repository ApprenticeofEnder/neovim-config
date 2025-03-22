local options = {
  formatters_by_ft = {
    css = { "prettier" },
    html = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "ruff_fix", "ruff_format" },
    typst = { "prettypst" },
    yaml = { "prettier" },
    c = { "clangd-format" },
    sql = { "sql_formatter" },
    rust = { "rustfmt" },
    ["*"] = { "injected" },
  },
  linters_by_ft = {
    make = { "checkmake" },
  },
  formatters = {
    prettypst = {
      command = "prettypst",
      args = { "--use-std-in", "--use-std-out" },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 10000,
    lsp_fallback = true,
  },
}

return options
