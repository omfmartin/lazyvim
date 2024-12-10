-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("telekasten").setup({
  home = vim.fn.expand("~/Nextcloud/notes/"),
  vaults = {
    perso = {
      home = vim.fn.expand("~/Nextcloud/notes/perso"),
      templates = vim.fn.expand("~/Nextcloud/notes/perso/templates"),
    },
    pro = {
      home = vim.fn.expand("~/Nextcloud/notes/pro/"),
      templates = vim.fn.expand("~/Nextcloud/notes/pro/templates"),
    },
  },
})
