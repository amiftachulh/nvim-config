return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    local project_tools = require('core.detect-tools').detect_tools()

    lint.linters_by_ft = {
      go = { 'staticcheck' },
    }

    if project_tools.biome then
      lint.linters_by_ft.javascript = { 'biome' }
      lint.linters_by_ft.javascriptreact = { 'biome' }
      lint.linters_by_ft.typescript = { 'biome' }
      lint.linters_by_ft.typescriptreact = { 'biome' }
    elseif project_tools.eslint then
      lint.linters_by_ft.javascript = { 'eslint' }
      lint.linters_by_ft.javascriptreact = { 'eslint' }
      lint.linters_by_ft.typescript = { 'eslint' }
      lint.linters_by_ft.typescriptreact = { 'eslint' }
    end

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
