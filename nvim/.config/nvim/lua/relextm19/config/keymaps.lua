local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>e", ":Oil<CR>", { desc = "Open oil" })
map("n", "<leader>zz", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- Clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard after cursor" })
map("n", "<leader>P", '"+P', { desc = "Paste from system clipboard before cursor" })

-- General
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true, desc = "Clear search highlights" })
map('n', '<leader>rr', ':Lazy reload timetracker<CR>', { desc = "Reload timetracker plugin" })
map("n", "<leader>k", function() vim.diagnostic.open_float() end, { desc = "Open floating diagnostic" })

-- Window Navigation & Splits
map('n', '<C-h>', '<C-w>h', { desc = "Move to left window" })
map('n', '<C-j>', '<C-w>j', { desc = "Move to lower window" })
map('n', '<C-k>', '<C-w>k', { desc = "Move to upper window" })
map('n', '<C-l>', '<C-w>l', { desc = "Move to right window" })
map('n', '<leader>v', '<cmd>vsplit<cr>', { desc = "Split window vertically" })
map('n', '<leader>s', '<cmd>split<cr>', { desc = "Split window horizontally" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        -- Helper to easily add descriptions without repeating the opts table
        local function lsp_map(mode, lhs, rhs, desc)
            map(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
        end

        lsp_map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
        lsp_map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
        lsp_map("n", "gr", vim.lsp.buf.references, "LSP: Show references")
        lsp_map("n", "gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
        lsp_map("n", "K", vim.lsp.buf.hover, "LSP: Hover documentation")
        lsp_map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename symbol")
    end,
})

-- Telescope
-- Helper for telescope mappings to keep things clean
local function tele_map(lhs, rhs, desc)
    map("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

tele_map("<leader>ff", function() require("telescope.builtin").find_files() end, "Telescope: Find files")
-- tele_map("<leader>ff", function() require("telescope.builtin").git_files() end, "Telescope: Git files")
tele_map("<leader>fg", function() require("telescope.builtin").live_grep() end, "Telescope: Live grep")
tele_map("<leader>fb", function() require("telescope.builtin").buffers() end, "Telescope: Find buffers")
tele_map("<leader>fh", function() require("telescope.builtin").help_tags() end, "Telescope: Help tags")
tele_map("<leader>ft", function() require("telescope.builtin").tags() end, "Telescope: Find tags")
tele_map("<leader>fc", function() require("telescope.builtin").commands() end, "Telescope: Find commands")
tele_map("<leader>fk", function() require("telescope.builtin").keymaps() end, "Telescope: Find keymaps")
