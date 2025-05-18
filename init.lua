require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.colorscheme',
  require 'plugins.transparent',
  require 'plugins.vim-sleuth',
  require 'plugins.neo-tree',
  require 'plugins.which-key',

  -- Git
  require 'plugins.gitsigns',
  require 'plugins.lazy-git',

  -- Search and Navigation
  require 'plugins.telescope',

  -- LSP and Completion
  require 'plugins.lsp',
  require 'plugins.blink',
  require 'plugins.autopairs',

  -- Treesitter
  require 'plugins.treesitter',
  require 'plugins.treesitter-context',

  -- UI
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.indent-blankline',

  -- Code Formatting and Linting
  require 'plugins.conform',
  require 'plugins.lint',

  -- Miscellaneous
  require 'plugins.todo-comments',
  require 'plugins.comment',
  require 'plugins.spectre',
  require 'plugins.ufo',
  require 'plugins.copilot',
  require 'plugins.neocord',
  require 'plugins.visual-multi',
  require 'plugins.autotag',
  require 'plugins.mini',
  require 'plugins.marks',
}
