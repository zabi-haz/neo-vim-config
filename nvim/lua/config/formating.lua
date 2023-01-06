local null_ls = require("null-ls")
formatting = null_ls.builtins.formatting
local sources = {
	formatting.prettier,
  formatting.eslint,
	formatting.autopep8,
	formatting.stylua,
}
null_ls.setup({
	debug = false,
	sources = sources,
})
