-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { noremap = true, silent = true, desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>z', '<C-w>s', { noremap = true, silent = true, desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { noremap = true, silent = true, desc = 'Equal split windows' })
vim.keymap.set('n', '<leader>xs', ':close<CR>', { noremap = true, silent = true, desc = 'Close current split' })

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts) -- Move focus to the top window
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts) -- Move focus to the bottom window
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts) -- Move focus to the left window
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts) -- Move focus to the right window

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { noremap = true, silent = true, desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { noremap = true, silent = true, desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { noremap = true, silent = true, desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { noremap = true, silent = true, desc = 'Go to previous tab' })

-- Toggle wrap
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = 'Toggle wrap' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true, desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true, desc = 'Open diagnostics list' })

-- Move line
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', opts) -- Move line down
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', opts) -- Move line up
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', opts) -- Move line down
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', opts) -- Move line up
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", opts) -- Move line down
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", opts) -- Move line up

-- Bookmarks
vim.keymap.set('n', '<leader>dm', ':delmarks a-zA-Z0-9<CR>', { noremap = true, silent = true, desc = 'Delete all book[m]arks' })
