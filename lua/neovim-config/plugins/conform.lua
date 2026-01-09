function Prettier_or_biome(bufnr)
  local f = vim.fs.find({ "biome.jsonc" }, { upward = true })
  if not f then -- If a Biome file isn't configured, we'll use Prettier.
    return { "prettier" }
  end
  if require("conform").get_formatter_info("biome", bufnr).available then
    return { "biome" }
  else
    return { "prettier" }
  end
end

return {
  "stevearc/conform.nvim",
  log_level = vim.log.levels.DEBUG,
  event = "BufWritePre", -- uncomment for format on save
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      css = Prettier_or_biome,
      html = Prettier_or_biome,
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_fix", "ruff_format" },
      json = Prettier_or_biome,
      typst = { "typstyle" },
      yaml = { "prettier" },
      c = { "clangd-format" },
      sql = { "sql_formatter" },
      svelte = { "prettier" },
      rust = { "rustfmt" },
      typescript = Prettier_or_biome,
      typescriptreact = Prettier_or_biome,
      javascript = Prettier_or_biome,
      tsx = Prettier_or_biome,
      jsonc = Prettier_or_biome,
      vue = { "prettier" },
      xml = { "xmlformatter" },
      nix = { "alejandra" },
      jq = { "jqfmt" },
    },
    linters_by_ft = {
      make = { "checkmake" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },
    },
    formatters = {
      shfmt = {
        extra_args = { "-i", "2", "-ci", "-bn" },
      },
      jqfmt = {
        command = "jqfmt",
        args = { "-ob", "-ar", "-op", "pipe,comma,alt", "-f", "$FILENAME" },
      },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 10000,
      lsp_fallback = true,
    },
  },
}
