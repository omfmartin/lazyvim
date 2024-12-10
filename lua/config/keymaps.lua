-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TODO
-- Function to create a TODO item
function _G.create_todo()
  local line = vim.api.nvim_get_current_line()
  local updated_line = line .. "- [ ]  "
  vim.api.nvim_set_current_line(updated_line)
  vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), #updated_line + 2 })
  vim.api.nvim_feedkeys("i", "n", false) -- Enter insert mode
end

-- Function to mark as done
function _G.mark_done()
  local line = vim.api.nvim_get_current_line()
  local updated_line = line:gsub("%- %[.]", "- [x]")
  vim.api.nvim_set_current_line(updated_line)
end

-- Function to mark as started
function _G.mark_started()
  local line = vim.api.nvim_get_current_line()
  local updated_line = line:gsub("%- %[.]", "- [-]")
  vim.api.nvim_set_current_line(updated_line)
end

-- Function to mark as not done
function _G.mark_not_done()
  local line = vim.api.nvim_get_current_line()
  local updated_line = line:gsub("%- %[.]", "- [ ]")
  vim.api.nvim_set_current_line(updated_line)
end

-- Keybindings
vim.api.nvim_set_keymap("n", "<leader>tc", ":lua create_todo()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>td", ":lua mark_done()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":lua mark_started()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":lua mark_not_done()<CR>", { noremap = true, silent = true })

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
