return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter", -- load only when needed
    build = "cargo build --release",
    config = function()
        require("blink.cmp").setup({
            sources = { default = { "lsp", "path", "buffer" } },
            keymap = {
                ["<Tab>"] = { "accept", "fallback" },
            },
            completion = {
                documentation = { auto_show = true },
            },
        })
    end,
}
