-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'tpope/vim-fugitive',
  },
  {
    'aaronhallaert/advanced-git-search.nvim',
    cmd = { 'AdvancedGitSearch' },
    config = function()
      require('advanced_git_search.fzf').setup {
        -- Insert Config here
      }
    end,
    dependencies = {
      'ibhagwan/fzf-lua',
      'tpope/vim-fugitive',
      'tpope/vim-rhubarb',
    },
  },
}
