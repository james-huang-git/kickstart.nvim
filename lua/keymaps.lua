-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Window keymaps
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab keymaps
vim.keymap.set('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
vim.keymap.set('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
vim.keymap.set('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
vim.keymap.set('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
vim.keymap.set('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- Yank keymaps
vim.keymap.set('n', 'yp', ":let @+=expand('%:p')<CR>", { desc = 'Copy current file path' })

-- Git keymaps
vim.keymap.set('n', '<leader>gb', '<cmd>!gh browse<cr>', { desc = 'Github [B]rowse Repo' })

-- Quit all
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Puts current work under cursor into search reg and feeds cgn to change the word
local function search_and_cgn()
  local mode = vim.fn.mode()

  if mode == 'v' or mode == 'V' then
    -- Yank visual selection into "s" register without clobbering unnamed register
    vim.cmd 'silent normal! "sy'

    -- Use the yanked text as the search pattern
    vim.fn.setreg('/', vim.fn.getreg 's')

    -- Exit visual mode before feeding keys
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
  else
    -- Normal mode: use word under cursor
    vim.fn.setreg('/', vim.fn.expand '<cword>')
  end

  -- Enable search highlighting
  vim.o.hlsearch = true

  -- Trigger cgn
  vim.api.nvim_feedkeys('cgn', 'n', false)
end

vim.keymap.set({ 'n', 'v' }, '<leader>r', search_and_cgn, { silent = true, desc = '[R]eplace' })
