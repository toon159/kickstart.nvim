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
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
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
        lualine_a = { 'buffers' },
        lualine_z = { 'tabs' },
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
}
