local M = {}

function M.get_line_number()
  return vim.api.nvim_win_get_cursor(0)[1]
end

function M.basename(str)
  local name = string.gsub(str, '(.*/)(.*)', '%2')
  return name
end

function M.jump_to_line(search_text)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for i, line in ipairs(lines) do
    if string.find(line, search_text, 1, true) then
      vim.fn.cursor { i, 1 }
      return true
    end
  end
  return false
end

function M.copy_file_name()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local base = M.basename(buf_name)
  vim.fn.setreg('+', base)
  print(base .. ' yanked!!')
  return base
end

function M.get_os()
  return vim.loop.os_uname()
end

function M.get_dir_name()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

function M.get_buffer_text(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local text = table.concat(lines, '\n')
  return text
end

function M.dirname(str)
  local name = string.gsub(str, '(.*/)(.*)', '%1')
  return name
end

function M.open_url(url)
  local opener = M.get_os() == 'Linux' and 'xdg-open' or 'open'
  vim.cmd('exec "!' .. opener .. " '" .. url .. '\'"')
end

function M.copy_relative_filepath(quiet)
  local file_path = vim.fn.fnamemodify(vim.fn.expand '%:h', ':p:~:.')
  local file_name = M.copy_file_name()
  local res = file_path .. file_name
  vim.fn.setreg('+', res)
  if not quiet then
    require 'notify' ('Copied relative filepath.', vim.log.levels.INFO)
  end

  return res
end

return M
