return {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'xml', 'vue', 'javascriptreact', 'typescriptreact' },
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function ()
        require("nvim-ts-autotag").setup({
            aliases = {
                ["vue"] = "html",-- treat vue as html to autoclose tags such as <template>
            }
        })
    end
}
