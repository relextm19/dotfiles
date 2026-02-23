local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>e", ":Oil<CR>", { desc = "Open oil" })
map("n", "<leader>zz", ":LazyGit<CR>", { desc = "Open LazyGit" })

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard after cursor" })
map("n", "<leader>P", '"+P', { desc = "Paste from system clipboard before cursor" })

vim.keymap.set('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

map('n', '<leader>rr', ':Lazy reload timetracker<CR>') --only for plugin development

map("n", "<leader>k", function() vim.diagnostic.open_float() end)

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<leader>v', '<cmd>vsplit<cr>')
map('n', '<leader>s', '<cmd>split<cr>')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        local opts = { buffer = bufnr, silent = true, noremap = true }

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end,
})

local telescope_opts = { noremap = true, silent = true }

map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, telescope_opts)
-- map("n", "<leader>ff", function() require("telescope.builtin").git_files() end, telescope_opts)
map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, telescope_opts)
map("n", "<leader>fb", function() require("telescope.builtin").buffers() end, telescope_opts)
map("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, telescope_opts)
map("n", "<leader>ft", function() require("telescope.builtin").tags() end, telescope_opts)
map("n", "<leader>fc", function() require("telescope.builtin").commands() end, telescope_opts)
map("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, telescope_opts)

--harpoon keybinds
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
