-- Use :C to clear search highlights
vim.api.nvim_create_user_command('C', 'nohlsearch', {})

-- Force write of readonly files using sudo
vim.api.nvim_create_user_command('WS', 'w !sudo tee %', {})
