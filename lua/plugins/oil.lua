return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { 'echasnovski/mini.nvim' },
  lazy = false,
  keys = {
    {
      '<leader>o',
      function()
        require('oil').open()
      end,
      desc = '[O]il file explorer',
    },
  },
}
