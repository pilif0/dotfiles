-- Make space leader
vim.g.mapleader = '<space>'

-- Make navigrating wrapped lines behave like normal lines
vim.keymap.set('', 'k', 'gk', { silent = true, remap = false })
vim.keymap.set('', 'j', 'gj', { silent = true, remap = false })
vim.keymap.set('', '0', 'g0', { silent = true, remap = false })
vim.keymap.set('', '$', 'g$', { silent = true, remap = false })
vim.keymap.set('', '^', 'g^', { silent = true, remap = false })
vim.keymap.set('', '_', 'g_', { silent = true, remap = false })

-- Disable K and Q
vim.keymap.set('', 'K', '<nop>', { remap = false })
vim.keymap.set('', 'Q', '<nop>', { remap = false })

-- Highlight the current word under the cursor (instead of highlight + next)
vim.keymap.set('n', '*', ":keepjumps normal! *N<CR>", { remap = false })
vim.keymap.set('n', '#', ":keepjumps normal! #N<CR>", { remap = false })

-- Create a manual fold with the region determined by going to the end of the
-- line, entering visual line mode, then jumping to the matching brace. So:
--
--     const foldThisFunction = (x) => {
--       // ...
--     }
--
-- cursor on first line will fold entire function definition, etc.
vim.keymap.set('n', '<leader>zf', '$V%zf', { silent = true, remap = false })

-- Cut/copy/paste with system clipboard
vim.keymap.set('', '<leader>y', '"+y', { silent = true, remap = false })
vim.keymap.set('', '<leader>Y', '"+Y', { silent = true, remap = false })
vim.keymap.set('', '<leader>d', '"+d', { silent = true, remap = false })
vim.keymap.set('', '<leader>D', '"+D', { silent = true, remap = false })
vim.keymap.set('', '<leader>p', '"+p', { silent = true, remap = false })
vim.keymap.set('', '<leader>P', '"+P', { silent = true, remap = false })
