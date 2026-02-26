return {
    {
        dir = "~/code/timetracker.nvim",
        name = "timetracker",
        dependencies = {
            "kkharji/sqlite.lua",
            "folke/snacks.nvim"
        },
        config = function()
            require('timetracker').setup()
        end,
    }
}
