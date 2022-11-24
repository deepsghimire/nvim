local config = {
  ensure_installed = {
    "c",
    "lua",
    "rust",
    "bash",
    "css",
    "cpp",
    "dockerfile",
    "gitignore",
    "gitattributes",
    "go",
    "html",
    "http",
    "javascript",
    "java",
    "json",
    "make",
    "markdown",
    "prisma",
    "python",
    "sql",
    "toml",
    "typescript",
    "tsx"
  },


  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('nvim-treesitter.configs').setup(config)
