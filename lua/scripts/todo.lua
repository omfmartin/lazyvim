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

function _G.auto_continue_list()
  local line = vim.api.nvim_get_current_line()

  -- Strip leading spaces before evaluating
  local trimmed = line:gsub("^%s+", "")

  local checkbox = trimmed:match("^%- %[[ x%-]%]")
  local bullet = trimmed:match("^%- ")

  -- Checkbox list item
  if checkbox then
    -- If it's just "- [ ]" or "- [x]" etc., stop continuation
    if trimmed:match("^%- %[[ x%-]%]%s*$") then
      return "\n"
    end
    return "\n- [ ] "
  end

  -- Plain bullet list item
  if bullet then
    if trimmed:match("^%-%s*$") then
      return "\n"
    end
    return "\n- "
  end

  -- Default Enter
  return "\n"
end

-- Apply only for Markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("i", "<CR>", "v:lua.auto_continue_list()", { expr = true, noremap = true, silent = true })
  end,
})
