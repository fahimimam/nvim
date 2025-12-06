-- Go tests + coverage
return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-go")({
                        experimental = { test_table = true },
                        args = { "-count=1", "-timeout=60s" },
                    }),
                },
                summary = { animated = true, follow = true },
                quickfix = { enabled = false },
                output = { open_on_run = true },
                discovery = { concurrent = 2 },
            })

            local map = vim.keymap.set
            map("n", "<leader>gt", function() neotest.run.run() end, { desc = "GoTest: Nearest" })
            map("n", "<leader>gT", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "GoTest: File" })
            map("n", "<leader>gP", function() neotest.run.run(vim.fn.getcwd()) end, { desc = "GoTest: Package (cwd)" })
            map("n", "<leader>gs", neotest.summary.toggle, { desc = "GoTest: Summary" })
            map("n", "<leader>go", neotest.output.open, { desc = "GoTest: Output window" })
            map("n", "<leader>gO", function() neotest.output.open({ enter = true }) end,
                { desc = "GoTest: Output (focus)" })
            map("n", "<leader>gx", neotest.run.stop, { desc = "GoTest: Stop" })
        end,
    },
    {
        "andythigpen/nvim-coverage",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("coverage").setup({
                auto_reload = true,
                lang = {
                    go = {
                        coverage_file = "coverage.out",
                    },
                },
                signs = {
                    covered = { hl = "CoverageCovered", text = "▎" },
                    uncovered = { hl = "CoverageUncovered", text = "▎" },
                },
            })
            local map = vim.keymap.set
            map("n", "<leader>gC", function() require("coverage").load() end, { desc = "Coverage: Load file" })
            map("n", "<leader>gc", function() require("coverage").toggle() end, { desc = "Coverage: Toggle signs" })
            map("n", "<leader>gR", function() require("coverage").summary() end, { desc = "Coverage: Summary" })
        end,
    },
}

