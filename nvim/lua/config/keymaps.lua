local mapKey = require("utils/keyMapper").mapKey

-- file save
mapKey('<leader>w', ':w<CR>')
mapKey('<leader>q', ':q!<CR>')

-- Neotree toggle
mapKey('<leader>e', ':Neotree toggle<CR>')

-- pane navigation
mapKey('<C-h>', '<C-w>h')
mapKey('<C-j>', '<C-w>j')
mapKey('<C-k>', '<C-w>k')
mapKey('<C-l>', '<C-w>l')

-- clear search hl
mapKey('<leader>h', ':nohlsearch<CR>')
