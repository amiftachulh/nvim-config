local M = {}

function M.load_last_colorscheme()
  local file = io.open(vim.fn.stdpath 'data' .. '/last_colorscheme', 'r')
  if file then
    local color_name = file:read '*all'
    file:close()
    color_name = color_name:gsub('^%s*(.-)%s*$', '%1')

    local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. color_name)
    if not status_ok then
      vim.notify('Could not load colorscheme: ' .. color_name, vim.log.levels.WARN)
      vim.cmd 'colorscheme default'
    end
  else
    vim.cmd 'colorscheme default'
  end
end

return M
