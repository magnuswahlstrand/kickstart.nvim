return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  config = function(_, opts)
    -- Setup obsidian.nvim
    require('obsidian').setup(opts)

    -- Create which-key mappings for common commands.obsi
    local wk = require 'which-key'

    wk.add {
      { '<leader>o', group = 'Obsidian' },
      { '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'Open note' },
      { '<leader>od', '<cmd>ObsidianDailies -10 0<cr>', desc = 'Daily notes' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste image' },
      { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick switch' },
      { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'Search' },
      { '<leader>ot', '<cmd>ObsidianTags<cr>', desc = 'Tags' },
      { '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = 'Links' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Backlinks' },
      { '<leader>om', '<cmd>ObsidianTemplate<cr>', desc = 'Template' },
      { '<leader>on', '<cmd>ObsidianQuickSwitch nav<cr>', desc = 'Nav' },
      { '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Rename' },
      { '<leader>oc', '<cmd>ObsidianTOC<cr>', desc = 'Contents (TOC)' },
      {
        mode = { 'v' },
        -- { "<leader>o", group = "Obsidian" },
        {
          '<leader>oe',
          function()
            local title = vim.fn.input { prompt = 'Enter title (optional): ' }
            vim.cmd('ObsidianExtractNote ' .. title)
          end,
          desc = 'Extract text into new note',
        },
        {
          '<leader>ol',
          function()
            vim.cmd 'ObsidianLink'
          end,
          desc = 'Link text to an existing note',
        },
        {
          '<leader>on',
          function()
            vim.cmd 'ObsidianLinkNew'
          end,
          desc = 'Link text to a new note',
        },
        {
          '<leader>ot',
          function()
            vim.cmd 'ObsidianTags'
          end,
          desc = 'Tags',
        },
      },
    }
  end,
  opts = {
    workspaces = {
      {
        name = 'work',
        path = '~/repo/obsidian/work',
      },
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = 'fzf-lua',
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      -- see below for full list of options 👇
    },
  },
}
