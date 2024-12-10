-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Telekasten settings
require("telekasten").setup({
  home = vim.fn.expand("~/Nextcloud/notes/"),
  vaults = {
    perso = {
      home = vim.fn.expand("~/Nextcloud/notes/perso"),
      templates = vim.fn.expand("~/Nextcloud/notes/templates"),
    },
    pro = {
      home = vim.fn.expand("~/Nextcloud/notes/pro/"),
      templates = vim.fn.expand("~/Nextcloud/notes/templates"),
    },
  },
})

-- Markdown todo
require("scripts.todo")

-- Compiler for windows
-- require("nvim-treesitter.install").compilers = { "clang" }

-- Vertical line
vim.opt.colorcolumn = "119"
