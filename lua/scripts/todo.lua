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

-- Create new TODO
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.keymap.set("i", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local indentation = line:match("^%s*") or "" -- Capture leading whitespace
      local checkbox = line:match("^%s*%- %[[x ]%]") -- Match `- [ ]` or `- [x]`

      if checkbox then
        -- Continue with the same checkbox format
        return "\n" .. indentation .. "- [ ] "
      else
        -- Default behavior: just a new line
        return "\n"
      end
    end, { buffer = true, expr = true })
  end,
})

-- Keybindings
vim.api.nvim_set_keymap("n", "<leader>tc", ":lua create_todo()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>td", ":lua mark_done()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":lua mark_started()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":lua mark_not_done()<CR>", { noremap = true, silent = true })
