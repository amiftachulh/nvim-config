return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  config = function()
    require('core.load_colorscheme').load_last_colorscheme()
    require('transparent').setup {}
  end,
}
