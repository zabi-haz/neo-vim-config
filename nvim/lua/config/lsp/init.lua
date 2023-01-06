local status_ok, _ = pcall(require , "lspconfig")
if not status_ok then
	return
end
local function lsp_highlight_document(client)
  -- if client.server_capabilities.document_highlight then
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
      return
    end
    illuminate.on_attach(client)
  -- end
end
require("config.lsp.lsp-installer")
require("config.lsp.handlers").setup()
