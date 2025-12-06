-- ~/.config/nvim/lua/plugins/mini-icons.lua
return {
    "echasnovski/mini.icons",
    version = false, -- always latest
    config = function()
        require("mini.icons").setup()
    end,
}
