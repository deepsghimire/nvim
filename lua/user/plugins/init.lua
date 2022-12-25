local status, packer = pcall(require, "packer")

if not status then
  print("Error loading packer")
  return
end

local which_key_config = require('user.plugins.which_key')
local telescope_config = require('user.plugins.telescope')
local null_ls_config = require('user.plugins.null-ls')

packer.startup(function(use)

  -- plugins here

  -- manage self
  use 'wbthomason/packer.nvim'

  -- current colorscheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- help me
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup(which_key_config)
    end
  }

  -- you know what this is
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require("telescope").setup(telescope_config)
      require('telescope').load_extension("fzf")
    end
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
  use { "neovim/nvim-lspconfig" }

  use { 'L3MON4D3/LuaSnip',
    tag = "v1.*",
    requires = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip').config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
        ext_opts = {
          [require("luasnip.util.types").choiceNode] = {
            active = {
              virt_text = { { "<-", "Error" } }
            }
          }
        }
      }
      require("luasnip.loaders.from_vscode").lazy_load()
      require('luasnip').filetype_extend("javascript", { "javascriptreact" })
    end }

  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'onsails/lspkind.nvim' }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path"
    },
  }

  -- tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults

      })
    end
  })
  -- trouble
  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  }

  use { "windwp/nvim-ts-autotag", config = function()
    require('nvim-ts-autotag').setup()
  end }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require("lsp-colors").setup()
    end

  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local formatting = require("null-ls").builtins.formatting
      local code_action = require("null-ls").builtins.code_actions
      local diagnostics = require("null-ls").builtins.diagnostics

      require("null-ls").setup({
        debug = true,
        sources = {
          code_action.eslint,
          code_action.shellcheck,
          diagnostics.alex,
          diagnostics.checkmake,
          diagnostics.clang_check,
          diagnostics.eslint,
          diagnostics.flake8,
          diagnostics.golangci_lint,
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
          formatting.prettier,
          formatting.rustywind,
          formatting.sqlfluff,
          formatting.stylua,
        }
      })
    end
  }

end)

require('user.plugins.completion')
require('user.plugins.tree-sitter')
