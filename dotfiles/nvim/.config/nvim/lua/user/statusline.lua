o = vim.opt

o.laststatus = 3
o.statusline = ''
  .. '%r ' -- read only indicator
  .. '%f ' -- relative path in the current directory
  .. '%m ' -- modified marker
  .. '%='  -- side divider
  .. '%{&fileencoding?&fileencoding:&encoding} ' -- file encoding
  .. '%y ' -- filetype indicator
o.winbar = " %t %M"
