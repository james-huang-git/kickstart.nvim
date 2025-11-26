-- Neogit config

return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neo[G]it UI' },
    { '<leader>gh', '<cmd>NeogitLogCurrent<cr>', desc = 'Show NeoGit [H]istory' },
  },
  config = function()
    require('neogit').setup {
      kind = 'vsplit', -- opens neogit in a split
    }
  end,
}
