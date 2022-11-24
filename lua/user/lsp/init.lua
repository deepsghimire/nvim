local DEFAULT_SETTINGS = {
  -- The directory in which to install packages.

  -- Where Mason should put its bin location in your PATH. Can be one of:
  -- - "prepend" (default, Mason's bin location is put first in PATH)
  -- - "append" (Mason's bin location is put at the end of PATH)
  -- - "skip" (doesn't modify PATH)
  ---@type '"prepend"' | '"append"' | '"skip"'
  PATH = "prepend",

  pip = {
    -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
    upgrade_pip = false,

    -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
    -- and is not recommended.
    --
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },

  -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
  -- debugging issues with package installations.
  log_level = vim.log.levels.INFO,

  -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
  -- packages that are requested to be installed will be put in a queue.
  max_concurrent_installers = 4,

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },

  -- The provider implementations to use for resolving package metadata (latest version, available versions, etc.).
  -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
  -- Builtin providers are:
  --   - mason.providers.registry-api (default) - uses the https://api.mason-registry.dev API
  --   - mason.providers.client                 - uses only client-side tooling to resolve metadata
  providers = {
    "mason.providers.registry-api",
  },

  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = true,

    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",

    icons = {
      -- The list icon to use for installed packages.
      package_installed = "✓",
      -- The list icon to use for packages that are installing, or queued for installation.
      package_pending = "➜",
      -- The list icon to use for packages that are not installed.
      package_uninstalled = "✗",
    },

    keymaps = {
      -- Keymap to expand a package
      toggle_package_expand = "<CR>",
      -- Keymap to install the package under the current cursor position
      install_package = "i",
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = "u",
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = "c",
      -- Keymap to update all installed packages
      update_all_packages = "U",
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = "C",
      -- Keymap to uninstall a package
      uninstall_package = "X",
      -- Keymap to cancel a package installation
      cancel_installation = "<C-c>",
      -- Keymap to apply language filter
      apply_language_filter = "<C-f>",
    },
  },
}

require('mason').setup(DEFAULT_SETTINGS)

require('mason-lspconfig').setup({
  ensure_installed = {
    "awk_ls",
    "bashls",
    "clangd",
    "cssls",
    "cssmodules_ls",
    "dockerls",
    "emmet_ls",
    "gopls",
    "html",
    "jsonls",
    "tsserver",
    "sumneko_lua",
    "marksman",
    "prismals",
    "pyright",
    "sqlls",
    "tailwindcss"
  },
  automatic_installation = true
}
)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>s', function() vim.lsp.buf.format { async = false }
    vim.api.nvim_command("write")
  end, bufopts)
  vim.keymap.set('v', '<leader>la', vim.lsp.buf.range_code_action, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers {
  function(server)
    require('lspconfig')[server].setup { on_attach = on_attach, capabilities = capabilities }
  end
}
