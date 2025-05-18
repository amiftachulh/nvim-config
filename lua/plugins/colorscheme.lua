return {
  {
    'folke/tokyonight.nvim',
    styles = {
      comments = { italic = false },
    },
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
    config = function()
      require('kanagawa').setup {
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        overrides = function()
          return {
            -- Comment = { fg = '#7fdbca', italic = false },
            Visual = { bg = '#314868' },
          }
        end,
      }
    end,
  },
  { 'navarasu/onedark.nvim' },
  { 'EdenEast/nightfox.nvim' },
  {
    'Mofiqul/vscode.nvim',
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup {
        group_overrides = {
          NeoTreeIndentMarker = { fg = c.vscFront },
        },
      }
    end,
  },
}
