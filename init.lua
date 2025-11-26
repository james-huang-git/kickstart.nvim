require 'globals'
require 'keymaps'
require 'options'
require 'apis'
require 'lazy_bootstrap'

require('lazy').setup({
  require 'plugins.guess-indent',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lazydev',
  require 'plugins.lspconfig',
  require 'plugins.conform',
  require 'plugins.blink-cmp',
  require 'plugins.todo-comments',
  require 'plugins.mini-icons',
  require 'plugins.debug',
  require 'plugins.autopairs',
  require 'plugins.kickstart-gitsigns',
  require 'plugins.theme',
  require 'plugins.neogit',
  require 'plugins.snacks',
  require 'plugins.oil',
  require 'plugins.treesitter',
  -- require 'plugins.indent_line',
  -- require 'plugins.lint',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
