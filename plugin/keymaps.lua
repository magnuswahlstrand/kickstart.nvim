-- Inspired by TJ https://github.com/tjdevries/config.nvim/blob/master/plugin/keymaps.lua
local set = vim.keymap.set
local k = vim.keycode
-- local f = require 'custom.f'
-- local fn = f.fn

set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })
