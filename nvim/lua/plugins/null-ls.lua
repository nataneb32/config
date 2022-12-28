return function()
local null_ls = require("null-ls")

null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
	null_ls.builtins.diagnostics.php,
	null_ls.builtins.formatting.fixjson,
	null_ls.builtins.formatting.phpcsfixer.with({
		extra_args = {'--allow-risky=yes' }
	})
    },
})
end
