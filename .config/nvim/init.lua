-- Set colorscheme to one of the distributed ones
vim.cmd.colorscheme 'sorbet'

-- Load plugin-independent settings
require('settings') -- General settings
require('convenience') -- Convenience commands and abbreviations
require('keybindings') -- Key bindings
require('terminal') -- Terminal related settings

-- Load lazy as package manager
require('config.lazy')
