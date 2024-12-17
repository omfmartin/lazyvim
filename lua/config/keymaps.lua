-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap Esc
vim.keymap.set({ "i", "v", "c" }, "jk", "<Esc>", { noremap = true, silent = true, desc = "Enter normal mode" })

-- Delete everything
vim.keymap.set("n", "<leader>dd", ":%d<CR>", { noremap = true, silent = true, desc = "Delete everything" })
vim.keymap.set(
  "n",
  "<leader>dD",
  ":%d_<CR>",
  { noremap = true, silent = true, desc = "Delete everything (black hole)" }
)

-- Yank everything
vim.keymap.set("n", "<leader>yy", ":%y<CR>", { noremap = true, silent = true, desc = "Yank everything" })

-- Telekasten
----------------------------------------------------------------------------------------------------------------------
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

-- Buffer
----------------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
