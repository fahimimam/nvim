-- Unified diagnostics & references view
return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "Trouble" },
        config = function()
            require("trouble").setup({
                position = "bottom",
                height = 15,
                mode = "document_diagnostics",
                auto_open = false,
                auto_close = false,
                use_diagnostic_signs = true,
            })
            local map = vim.keymap.set
            map("n", "<leader>td", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble: Diagnostics" })
            map("n", "<leader>tr", "<cmd>Trouble lsp_references toggle<CR>", { desc = "Trouble: References" })
            map("n", "<leader>ts", "<cmd>Trouble symbols toggle<CR>", { desc = "Trouble: Symbols" })
            map("n", "<leader>tq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Trouble: Quickfix" })
        end,
    },
}
