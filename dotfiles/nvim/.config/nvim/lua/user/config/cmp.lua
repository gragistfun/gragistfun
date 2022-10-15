local cmp = require 'cmp'

cmp.setup {
  mapping = {
    ['<Tab>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>']   = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-f>']     = cmp.mapping.scroll_docs(4),
    ['<C-d>']     = cmp.mapping.scroll_docs(-4),
    ['<CR>']      = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
  },
  sources = {
    { name = 'nvim_lua', keyword_length = 4 },
    { name = 'path', keyword_length = 4 },
    { name = 'buffer', keyword_length = 4 },
    { name = 'rg', keyword_length = 4 },
  },
}

cmp.setup.cmdline('/', { sources = { { name = 'buffer'  } } })
cmp.setup.cmdline(':', { sources = { { name = 'cmdline', keyword_length = 3} } })

