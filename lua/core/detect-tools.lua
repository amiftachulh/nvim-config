local M = {}

function M.detect_tools()
  local biome_configs = {
    'biome.json',
    'biome.jsonc',
  }

  local prettier_configs = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.jsonc',
    '.prettierrc.js',
    '.prettierrc.cjs',
    '.prettierrc.mjs',
    '.prettierrc.yaml',
    '.prettierrc.yml',
    '.prettierrc.toml',
    'prettier.config.js',
    'prettier.config.cjs',
    'prettier.config.mjs',
    'prettier.config.yaml',
    'prettier.config.yml',
    'prettier.config.toml',
  }

  local eslint_configs = {
    '.eslintrc',
    '.eslintrc.json',
    '.eslintrc.jsonc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.mjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.toml',
    'eslint.config.js',
    'eslint.config.cjs',
    'eslint.config.mjs',
    'eslint.config.yaml',
    'eslint.config.yml',
    'eslint.config.toml',
  }

  local has_biome_config = false
  local has_prettier_config = false
  local has_eslint_config = false

  for _, file in ipairs(biome_configs) do
    if vim.fn.filereadable(vim.fn.getcwd() .. '/' .. file) == 1 then
      has_biome_config = true
      break
    end
  end

  for _, file in ipairs(prettier_configs) do
    if vim.fn.filereadable(vim.fn.getcwd() .. '/' .. file) == 1 then
      has_prettier_config = true
      break
    end
  end

  for _, file in ipairs(eslint_configs) do
    if vim.fn.filereadable(vim.fn.getcwd() .. '/' .. file) == 1 then
      has_eslint_config = true
      break
    end
  end

  local result = {
    biome = has_biome_config,
    prettier = has_prettier_config,
    eslint = has_eslint_config,
  }

  return result
end

return M
