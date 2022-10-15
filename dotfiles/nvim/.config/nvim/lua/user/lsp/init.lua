local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == 'sumneko_lua' then
    opts = require('user.lsp.config.sumneko_lua')
  end

  server:setup(opts)
end)
