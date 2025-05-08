-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Tmux & split window navigation
    'christoomey/vim-tmux-navigator',
  },
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
    signs = true, -- Enable icons for TODO, FIXME, etc.
    keywords = {
      TODO = { icon = ' ', color = 'info' },
      FIXME = { icon = ' ', color = 'error' },
    },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  -- {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('Comment').setup()
  --   end,
  -- },
  -- {
  --   -- Git signs in the gutter
  --   'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('gitsigns').setup()
  --   end,
  -- },
  -- {
  --   -- Markdown preview
  --   'iamcco/markdown-preview.nvim',
  --   build = 'cd app && npm install',
  -- },
  -- {
  --   -- Markdown preview for Neovim
  --   'ellisonleao/glow.nvim',
  --   config = function()
  --     require('glow').setup()
  --   end,
  -- },
  -- {
  --   -- Vim wiki
  --   'vimwiki/vimwiki',
  --   config = function()
  --     vim.g.vimwiki_list = {
  --       {
  --         path = '~/vimwiki/',
  --         syntax = 'markdown',
  --         ext = '.md',
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   -- Snippets
  --   'L3MON4D3/LuaSnip',
  -- },
  -- {
  --   -- Snippet engine for Neovim
  --   'saadparwaiz1/cmp_luasnip',
  -- },
  -- {
  --   -- Snippet engine for Neovim
  --   'hrsh7th/vim-vsnip',
  -- },
}
