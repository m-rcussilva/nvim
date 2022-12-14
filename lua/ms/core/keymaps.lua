vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

-- manage windows
keymap.set("n", "<leader>sv", "<C-W>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-W>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-W>=") -- make split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current slipt window

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>cx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>l", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>h", ":tabp<CR>") -- go to previous tab

-- -------------- --
-- plugin keymaps --
-- -------------- --

-- vim-maximizer
keymap.set("n", "<leader>mm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
