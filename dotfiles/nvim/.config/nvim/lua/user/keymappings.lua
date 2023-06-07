vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Insert mode mappings
keymap("i", "<C-a>", "<C-o>I", { silent = true })
keymap("i", "<C-e>", "<C-o>A", { silent = true })
keymap("i", "<C-k>", "<C-o>d$", { silent = true })

-- Automatic center down and up jumps
keymap("n", "<C-u>", "<C-u>zz", { silent = true })
keymap("n", "<C-d>", "<C-d>zz", { silent = true })

-- Automatically open folds and center on search jumps
keymap("n", "n", "nzvzz", { silent = true })
keymap("n", "N", "Nzvzz", { silent = true })

-- Buffers navigation
keymap("n", "<space><space>", "<C-^>", { noremap = true, silent = true })

-- Scroll without cursor movement
keymap("n", "<Up>", "<C-y>", { silent = true })
keymap("n", "<Down>", "<C-e>", { silent = true })
keymap("i", "<Up>", "<C-o><C-y>", { silent = true })
keymap("i", "<Down>", "<C-o><C-e>", { silent = true })

-- Better window movement
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Save file with CTRL-S
keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
keymap("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Remove highlighs
keymap("n", "<ESC>", ":noh<CR>", { noremap = true, silent = true })

-- Don't yank on delete char
keymap("n", "x", '"_x', { noremap = true, silent = true })
keymap("n", "X", '"_X', { noremap = true, silent = true })
keymap("v", "x", '"_x', { noremap = true, silent = true })
keymap("v", "X", '"_X', { noremap = true, silent = true })

-- Keep visual mode indenting
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Folds
keymap("n", "<Tab>", "za", { noremap = true, silent = true })
keymap("n", "<Leader><Tab>", "zi", { noremap = true, silent = true })
keymap("n", "<Leader>z", "zM", { noremap = true, silent = true })
keymap("n", "<Leader>Z", "zR", { noremap = true, silent = true })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
keymap("n", "<leader>fc", ":Telescope git_commits<CR>", { silent = true })

-- File Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Git
keymap("n", "<leader>gg", "<cmd>Git | only<CR>", { noremap = true, silent = true })
keymap("n", "<leader>gs", "<cmd>Gitsign stage_buffer<CR><ESC>", { noremap = true, silent = true })
keymap("v", "<leader>gs", "<cmd>Gitsign stage_hunk<CR><ESC>", { noremap = true, silent = true })

-- Disable
keymap("n", "Q", "<nop>", { noremap = true, silent = true }) -- Ex mode
keymap("n", "gQ", "<nop>", { noremap = true, silent = true })
keymap("n", "<f1>", "<nop>", { noremap = true, silent = true }) -- Help

