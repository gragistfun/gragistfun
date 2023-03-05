local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert {
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },

  sources = {
    { name = 'nvim_lua'},
    { name = 'nvim_lsp'},
    {
      name = 'buffer',
      keyword_length = 3,
    },
    {
      name = 'rg',
      keyword_length = 5,
    },
    { name = 'luasnip' },
    {
      name = 'spell',
      keyword_length = 3,
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return require('cmp.config.context').in_treesitter_capture('spell')
        end,
      },
    },
    { name = 'path' },
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        cmdline = "[cmdline]",
        luasnip = "[snip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        rg = "[rg]",
        spell = "[spell]",
      },
    },
  },
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      max_item_count = 20,
      keyword_length = 3,
    }
  })
})
