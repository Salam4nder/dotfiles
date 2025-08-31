local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- New tab
map('n', '<leader><C-i>', '<Cmd>tab split<CR>', opts)
map('n', '<leader>t', ':ToggleTerm size=20 dir= . direction=horizontal name=desktop<CR>', opts)

-- Windows
map('n', '<C-h>', '<cmd>:wincmd h<CR>', opts)
map('n', '<C-l>', '<cmd>:wincmd l<CR>', opts)
map('n', '<C-j>', '<cmd>:wincmd j<CR>', opts)
map('n', '<C-k>', '<cmd>:wincmd k<CR>', opts)

-- Nvim-Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Telescope
vim.g.rooter_patterns = { '.git', 'go.mod', 'Makefile'}
vim.g.rooter_manual_only = 1
map('n', '<leader>ff', ':let root_dir=FindRootDirectory()<CR>:execute ":Telescope find_files cwd=" . root_dir<CR>', opts)
map('n', '<leader>fs', ':let root_dir=FindRootDirectory()<CR>:execute ":Telescope live_grep cwd=" . root_dir<CR>', opts)
map('n', '<leader>fg', ':Telescope git_files<CR>', opts)

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
