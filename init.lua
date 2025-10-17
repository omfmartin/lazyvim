-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Telekasten settings
require("telekasten").setup({
  home = vim.fn.expand("~/Documents/notes/"),
  vaults = {
    perso = {
      home = vim.fn.expand("~/Documents/notes/"),
      templates = vim.fn.expand("~/Documents/notes/templates"),
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
-- require("nvim-treesitter.install").compilers = { "clang" }
