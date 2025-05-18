return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
    local formatters_by_ft = {
      html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      json = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      mdx = { 'prettier' },
      sql = { 'sql_formatter' },
      svelte = { 'prettier' },
    }

    -- local project_tools = require('core.detect-tools').detect_tools()
    --
    -- if project_tools.biome then
    --   local js_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json' }
    --   for _, ft in ipairs(js_filetypes) do
    --     formatters_by_ft[ft] = { 'biome' }
    --   end
    -- end

    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 10000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = formatters_by_ft,
    }
  end,
}
