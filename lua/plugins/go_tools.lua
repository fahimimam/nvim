-- Go-specific code helpers (tags, interfaces, tests)
return {
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = { "go" },
        build = function()
            vim.cmd([[GoInstallDeps]])
        end,
        config = function()
            require("gopher").setup({
                commands = {
                    go = "go",
                    gomodifytags = "gomodifytags",
                    gotests = "gotests",
                    impl = "impl",
                    iferr = "iferr",
                },
            })

            local map = vim.keymap.set
            -- Struct tags
            map("n", "<leader>ga", ":GoTagAdd json,yaml,db<CR>", { buffer = true, desc = "Go: Add common tags" })
            map("n", "<leader>grm", ":GoTagRm json,yaml,db<CR>", { buffer = true, desc = "Go: Remove common tags" })
            map("n", "<leader>gtg", ":GoTagAdd json<CR>", { buffer = true, desc = "Go: Add json tag(s)" })
            -- Generate tests
            map("n", "<leader>gtt", ":GoTestsAdd<CR>", { buffer = true, desc = "Go: Add tests for funcs" })
            map("n", "<leader>gtf", ":GoTestsFile<CR>", { buffer = true, desc = "Go: Generate tests file" })
            -- Interface implementation
            map("n", "<leader>gim", ":GoImpl<CR>", { buffer = true, desc = "Go: Implement interface" })
            -- If error snippet
            map("n", "<leader>gie", ":GoIfErr<CR>", { buffer = true, desc = "Go: Insert if err block" })
        end,
    },
}
