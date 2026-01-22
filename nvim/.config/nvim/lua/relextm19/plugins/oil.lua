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
                }
            })

            -- Create the Autocommand
            vim.api.nvim_create_autocmd("User", {
                pattern = "OilEnter",
                callback = function()
                    vim.schedule(function()
                        local oil = require("oil")
                        -- Use internal utility to check if preview is already open
                        -- This prevents the "toggle loop" (opening then closing)
                        if require("oil.util").get_preview_win() == nil then
                            oil.open_preview({ vertical = true, split = "botright" })
                        end
                    end)
                end,
            })
        end,
    }
}
