vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber=true

vim.o.wrap = true

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})
