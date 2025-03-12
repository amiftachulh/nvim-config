-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  config = function()
    require('neo-tree').setup {

      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
            ['l'] = 'open',
          },
          width = 30,
        },
        commands = {
          delete = function(state)
            local inputs = require 'neo-tree.ui.inputs'
            local path = state.tree:get_node().path
            local msg = 'Are you sure you want to trash ' .. path
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end
              vim.fn.system { 'gio', 'trash', vim.fn.fnameescape(path) }
              require('neo-tree.sources.manager').refresh(state.name)
            end)
          end,
        },
      },
    }

    vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', { fg = '#565f89', bg = 'NONE' })
  end,
}
