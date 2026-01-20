return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "lua", "go", "python", "javascript", "typescript", "vue", "godot_resource", "gdshader", "gdscript" },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = { "gdscript" },
            },
        }
    end,
}
