local o = vim.opt

-- Global options
o.mouse = 'a'

o.hidden = true

o.clipboard = 'unnamedplus'

o.backup = false
o.swapfile = false
o.undodir = '/tmp'
o.undofile = true

o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.scrolloff = 5
o.showmode = false

o.autoindent = true
o.smartindent = true
o.wrap = false
o.ignorecase = true

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldenable = false
o.foldtext = 'getline(v:foldstart)'
o.fillchars = {
    fold = ' '
}

o.spell = true

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.cursorline = true

o.splitbelow = true
o.splitright = true

o.list = true -- show whitespace
o.listchars = {
  trail = '•',
}

