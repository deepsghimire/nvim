local formatting = require("null-ls").builtins.formatting
local code_action = require("null-ls").builtins.code_actions
local diagnostics = require("null-ls").builtins.diagnostics

local config = {
  debug = true,
  sources = {
    code_action.cspell,
    code_action.eslint,
    code_action.shellcheck,
    diagnostics.alex,
    diagnostics.checkmake,
    diagnostics.clang_check,
    diagnostics.cspell,
    diagnostics.eslint,
    diagnostics.flake8,
    diagnostics.golangci_lint,
    diagnostics.jshint,
    diagnostics.jsonlint,
    diagnostics.luacheck,
    diagnostics.markdownlint,
    diagnostics.shellcheck,
    diagnostics.sqlfluff,
    diagnostics.zsh,
    formatting.black,
    formatting.cbfmt,
    formatting.eslint,
    formatting.gofmt,
    formatting.goimports,
    formatting.isort,
    formatting.jq,
    formatting.markdownlint,
    formatting.prettier_standard,
    formatting.rustywind,
    formatting.sqlfluff,
    formatting.stylua,
  }
}

return config
