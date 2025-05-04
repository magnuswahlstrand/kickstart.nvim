return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {}

    local builtin = require 'fzf-lua'

    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Fzf' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_cword, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sr', builtin.registers, { desc = '[S]earch [R]egisters' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
    vim.keymap.set('n', '<leader>sj', builtin.jumps, { desc = '[S]earch [J]umps' })
    --    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>ca', builtin.lsp_code_actions, { desc = '[C]ode [A]ction' })
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
    vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
    vim.keymap.set('n', '<leader>D', builtin.lsp_typedefs, { desc = 'Type [D]efinition' })
    vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
    vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
    vim.keymap.set({ 'n', 'v', 'i' }, '<C-x><C-f>', function()
      require('fzf-lua').complete_path()
    end, { silent = true, desc = 'Fuzzy complete path' })
  end,
  previewers = {
    builtin = {
      -- fzf-lua is very fast, but it really struggled to preview a couple files
      -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
      -- It turns out it was Treesitter having trouble parsing the files.
      -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
      -- (Yes, I know you shouldn't have 100KB minified files in source control.)
      syntax_limit_b = 1024 * 100, -- 100KB
    },
  },
}
