return {
  {
    'projekt0n/github-nvim-theme',
  },
  {
    'folke/tokyonight.nvim',
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require('tokyonight').setup {
        style = 'night',
        transparent = true,
      }
      -- vim.cmd.colorscheme 'tokyonight'
      --
      -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#6e78a1' })
      -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#6e78a1' })
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
      }

      vim.cmd.colorscheme 'catppuccin'

      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#6e78a1' })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#6e78a1' })
    end,
  },
}
