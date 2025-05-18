return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    keys = {
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle [P]in' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete [O]ther Buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the [R]ight' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the [L]eft' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
      { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
    },
    config = function()
      local status_ok, bufferline = pcall(require, 'bufferline')
      if not status_ok then
        return
      end
      bufferline.setup {
        options = {
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'Neo-tree',
              highlight = 'Directory',
              text_align = 'left',
            },
          },
          diagnostics = 'nvim_lsp',
          indicator = {
            style = 'icon',
            icon = ' ',
          },
        },
      }
    end,
  },
}
