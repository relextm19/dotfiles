return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "lua", "go", "python", "javascript", "typescript", "vue" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false, -- ← fix here (you had a typo)
            },
            indent = {
                enable = true,
            },
        }
    end,
}
