-- Enable LSP servers
vim.lsp.enable({ "gopls", "lua_ls", "ts_ls", "vtsls", "tailwindcss"})
local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}
vim.lsp.config('vtsls', {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})
vim.lsp.enable('vue_ls')

-- Diagnostics setup
vim.diagnostic.config({
    underline = true,
    virtual_text = {
        spacing = 4,             -- a bit of space from the code
        source = "if_many",      -- show the source if multiple LSPs
        format = function(diagnostic)
            return diagnostic.message -- just the message at end of line
        end,
    },
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = true },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

-- Global auto-command to enable formatting on save for any attached LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
    callback = function(event)
        -- 1. Get the client that just attached
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then return end

        -- 2. Check if the client supports formatting
        if client.supports_method("textDocument/formatting") then
            -- 3. Create a buffer-local autocmd for BufWritePre
            --    We use a unique group name per buffer to ensure we don't stack multiple 
            --    commands if multiple servers attach to the same file.
            local group = vim.api.nvim_create_augroup("LspFormatting-" .. event.buf, { clear = true })

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = group,
                buffer = event.buf,
                callback = function()
                    -- format the buffer synchronously
                    vim.lsp.buf.format({ async = false, bufnr = event.buf })
                end,
            })
        end
    end,
})
