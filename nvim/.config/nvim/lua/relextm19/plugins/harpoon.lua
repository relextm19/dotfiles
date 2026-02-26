return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- Harpoon
        local harpoon = require("harpoon")
        local map = vim.keymap.set
        harpoon:setup()

        map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
        map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Harpoon: Toggle quick menu" })

        map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: Select file 1" })
        map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: Select file 2" })
        map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: Select file 3" })
        map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: Select file 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        map("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous file" })
        map("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })
    end
}
