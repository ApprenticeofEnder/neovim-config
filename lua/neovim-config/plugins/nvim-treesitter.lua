local options = {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "python",
    "ini",
    "terraform",
    "comment",
    "markdown",
    "markdown_inline",
    "yaml",
    "svelte",
    "typst",
    "typescript",
    "tsx",
    "hcl",
    "go",
    "java",
    "jsonc",
    "c_sharp",
    "vue",
  },
}

vim.filetype.add {
  pattern = {
    [".env.*"] = "ini",
    [".env"] = "ini",
  },
}

vim.filetype.add {
  extension = {
    jinja = "jinja",
    jinja2 = "jinja",
    j2 = "jinja",
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = options,
}
