local mason_root = require("mason.settings").current.install_root_dir
local vue_language_server_path = mason_root .. '/packages/vue-language-server/node_modules/@vue/language-server'

vim.lsp.config('vtsls', {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vue_language_server_path,
                        languages = { 'vue' },
                        configNamespace = 'typescript',
                        enableForWorkspaceTypeScriptVersions = true,
                    },
                },
            },
        },
    },
})

vim.lsp.enable({ "gopls", "lua_ls", "vtsls", "tailwindcss", "vue_ls", "html", "cssls", "emmet_language_server",
    "marksman", "sqls" })

--setup godot
vim.lsp.config('gdscript', {
    cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
    root_markers = { 'project.godot', '.git' },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'gdscript',
    callback = function(args)
        -- Enable the client specifically for this buffer
        vim.lsp.enable('gdscript', { bufnr = args.buf })
    end,
})

-- Diagnostics setup
vim.diagnostic.config({
    underline = true,
    virtual_text = {
        spacing = 4,                  -- a bit of space from the code
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

-- remove unused imports in go
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params(0, "utf-16")
        params.context = { only = { "source.organizeImports" } }

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})
