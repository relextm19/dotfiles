local oil = require("relextm19.plugins.oil")
local mason = require("relextm19.plugins.mason")
local treesitter = require("relextm19.plugins.treesitter")
local autopairs = require("relextm19.plugins.autopairs")
local blink = require("relextm19.plugins.blink")
local telescope = require("relextm19.plugins.telescope")
local lspconfing = require("relextm19.plugins.lspconfig")
local colors = require("relextm19.plugins.colors")
local autotag = require("relextm19.plugins.autotag")
local surround = require("relextm19.plugins.surround")

return {unpack(oil), unpack(mason), unpack(treesitter),unpack(autopairs),unpack(blink), unpack(telescope), unpack(lspconfing), unpack(colors), unpack(autotag), unpack(surround)}
