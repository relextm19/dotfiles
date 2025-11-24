return {
	cmd = {
		"lua-language-server",
	},
	filetypes = {
		"lua",
	},
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	settings = {
	    Lua = {
            runtime = {
                version = "LuaJIT",  -- Neovim uses LuaJIT
            },
            diagnostics = {
                globals = { "vim" }, -- recognize 'vim' as global
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- include Neovim runtime
                checkThirdParty = false,
            },
        },
    },
    single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}
