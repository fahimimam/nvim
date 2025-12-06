-- ~/.config/nvim/lua/plugins/whichkey.lua
-- Updated which-key configuration using new 'win' key and new spec-based mapping style.

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- If you want icon support for groups/mappings, add: dependencies = { "echasnovski/mini.icons" }
    config = function()
        local wk = require("which-key")

        wk.setup({
            plugins = {
                marks = true,
                registers = true,
                spelling = { enabled = false },
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            -- 'window' deprecated -> use 'win'
            win = {
                border = "rounded",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 1, 2, 1, 2 },
                zindex = 50,
                no_overlap = true,
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 60 },
                spacing = 6,
                align = "center",
            },
            show_help = true,
            show_keys = true,
            disable = {
                filetypes = { "TelescopePrompt", "lazy", "alpha" },
            },
        })

        -- Group headings (these create the top-level labels)
        wk.add({
            { "<leader>f", group = "Find" },
            { "<leader>g", group = "Git" },
            { "<leader>t", group = "Terminal" },
        })

        -- Flat spec mappings (new API)
        wk.add({
            -- Explorer
            { "<leader>e",  ":Neotree toggle<CR>",                               desc = "Explorer" },

            -- Find group
            { "<leader>ff", ":Telescope find_files<CR>",                         desc = "Files" },
            { "<leader>fw", ":Telescope live_grep<CR>",                          desc = "Words" },
            { "<leader>fb", ":Telescope buffers<CR>",                            desc = "Buffers" },
            { "<leader>fh", ":Telescope help_tags<CR>",                          desc = "Help" },
            { "<leader>fo", ":Telescope oldfiles<CR>",                           desc = "Old Files" },
            { "<leader>fc", ":Telescope grep_string<CR>",                        desc = "Cursor String" },

            -- Git group
            { "<leader>gg", ":LazyGit<CR>",                                      desc = "LazyGit" },
            { "<leader>gb", ":Gitsigns blame_line<CR>",                          desc = "Blame line" },
            { "<leader>gp", ":Gitsigns preview_hunk<CR>",                        desc = "Preview hunk" },

            -- Terminal group
            { "<leader>th", ":ToggleTerm direction=horizontal<CR>",              desc = "Terminal Horizontal" },
            { "<leader>tv", ":ToggleTerm direction=vertical size=80<CR>",        desc = "Terminal Vertical" },
            { "<leader>tf", ":ToggleTerm direction=float<CR>",                   desc = "Terminal Float" },

            -- Formatting / buffers / quit
            { "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
            { "<leader>x",  ":bdelete<CR>",                                      desc = "Close buffer" },
            { "<leader>q",  ":q<CR>",                                            desc = "Quit window" },
            { "<leader>Q",  ":qa!<CR>",                                          desc = "Quit all" },

            -- LSP actions
            { "<leader>rn", vim.lsp.buf.rename,                                  desc = "Rename symbol" },
            { "<leader>ca", vim.lsp.buf.code_action,                             desc = "Code action" },

            -- (Optional) Some non-leader LSP navigation keys
            { "gd",         vim.lsp.buf.definition,                              desc = "Goto Definition",     mode = "n" },
            { "gr",         vim.lsp.buf.references,                              desc = "Goto References",     mode = "n" },
            { "gI",         vim.lsp.buf.implementation,                          desc = "Goto Implementation", mode = "n" },
            { "K",          vim.lsp.buf.hover,                                   desc = "Hover",               mode = "n" },
        })
    end,
}
