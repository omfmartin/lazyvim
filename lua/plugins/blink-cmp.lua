return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" }, -- enable enter to accept
      },
      completion = {
        list = {
          selection = {
            preselect = false,
          },
        },
      },
    },
  },
}
