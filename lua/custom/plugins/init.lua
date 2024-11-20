-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {},
    -- Optional dependencies
    -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    keys = {
      { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
    },
    config = function()
      require('oil').setup {
        columns = {
          'permission',
          'size',
          'mtime',
          'icon',
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          -- Show hidden files and folders
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == '..' or name == '.git' or name == '.DS_Store'
          end,
        },
        win_options = {
          wrap = true,
        },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      tabline = {
        lualine_a = { { 'buffers', show_filename_only = false, mode = 2 } },
        lualine_z = { { 'filename', path = 1 } },
      },
    },
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
  },
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    opts = {
      history = true,
      region_check_events = 'InsertEnter',
      delete_check_events = 'TextChanged,InsertLeave',
    },
  },
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
