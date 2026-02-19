return {
    {
        dir = "~/code/timetracker.nvim", -- Path to your plugin's root folder
        name = "timetracker",            -- Optional: give it a custom name in the Lazy UI
        config = function()
            require('timetracker').setup()
        end,
    }
}
