return {
	"mfussenegger/nvim-jdtls",
	opts = {
		root_dir = function(filename)
			return require("lspconfig").util.root_pattern("makefile")(filename) or vim.fn.getcwd()
			-- return vim.fs.find({ "" }, { path = filename, upward = true })[1]
		end,
	},
}
