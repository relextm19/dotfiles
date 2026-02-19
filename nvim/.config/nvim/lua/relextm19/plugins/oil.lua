return {
    {
        'stevearc/oil.nvim',
        lazy = false,
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        config = function()
            require("oil").setup({
                preview = {
                    update_on_cursor_moved = true,
                    max_width = 0.7,
                },
                keymaps = {
                    ["<C-p>"] = false,
                    ["q"] = "actions.close",
                },
                view_options = {
                    show_hidden = true
                },
            })
        end,
    }
}
