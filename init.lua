-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Telekasten settings
require("telekasten").setup({
  home = vim.fn.expand("~/Nextcloud/notes/"),
  vaults = {
    perso = {
      home = vim.fn.expand("~/Nextcloud/notes/1_perso"),
      templates = vim.fn.expand("~/Nextcloud/notes/templates"),
    },
    travail = {
      home = vim.fn.expand("~/Nextcloud/notes/2_travail/"),
      templates = vim.fn.expand("~/Nextcloud/notes/templates"),
    },
  },
})

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  -- Install these LSPs automatically
  ensure_installed = {
    "bashls",
    "cssls",
    "html",
    "gradle_ls",
    "groovyls",
    "lua_ls",
    "jsonls",
    "lemminx",
    "marksman",
    "quick_lint_js",
    "yamlls",
    "pyright",
  },
})

require("mason-tool-installer").setup({
  -- Install these linters, for
  "black",
  "debugpy",
  "flake8",
  "isort",
  "mypy",
  "pylint",
})

-- Markdown todo
require("scripts.todo")

-- Compiler for windows
require("nvim-treesitter.install").compilers = { "clang" }
