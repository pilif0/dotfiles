-- Display line numbers
vim.opt.number = true

-- Display substitute effects in a split
vim.opt.inccommand = 'split'

-- Ignore case when searching
vim.opt.ignorecase = true

-- Highlight matching brackets
vim.opt.showmatch = true

-- Don't let the cursor touch the edge of the viewport
vim.opt.scrolloff = 3

-- After split, focus right/bottom half
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Indent wrapped lines to the same level
vim.opt.breakindent = true

-- Highlight relevant column when maximum text width is set
vim.opt.colorcolumn = '+0'

-- Don't show "-- INSERT --" in insert mode (preserves command output)
vim.opt.showmode = false

-- Expand tabs into spaces
vim.opt.expandtab = true

-- Dfeault number of spaces for hard tab/soft tab/when <TAB> is pressed
local indent = 2
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent

-- Carry over indent on new line
vim.opt.autoindent = true

-- Enable list mode to show non-printing characters
vim.opt.list = true

-- Don't show trailing whitespace and EOL
-- (vim-better-whitespace takes care of highlighting trailing whitespace)
vim.opt.listchars:remove({ 'trail', 'eol' })
