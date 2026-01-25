return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        {
            "rcarriga/nvim-notify",
            opts = {
                background_colour = "#191724", -- rose pine background hardcoded so not very good but whaterver
                render = "compact",
                stages = "static"
            }
        },
    },
    config = function(_, opts)
        require("noice").setup(opts)
    end
}
