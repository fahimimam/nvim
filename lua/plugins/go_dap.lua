-- Go debugging: DAP + UI + Go helpers

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup({
                layouts = {
                    {
                        elements = { "scopes", "breakpoints", "stacks", "watches" },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = { "repl", "console" },
                        size = 10,
                        position = "bottom",
                    },
                },
                controls = {
                    enabled = true,
                    element = "repl",
                    icons = { pause = "", play = "", step_into = "", step_over = "", step_out = "", run_last = "↻", terminate = "■" },
                },
            })

            require("nvim-dap-virtual-text").setup({
                highlight_changed_variables = true,
                show_stop_reason = true,
            })

            require("dap-go").setup({
                delve = {
                    path = "dlv",
                    initialize_timeout_sec = 20,
                    port = "${port}",
                    args = {},
                    build_flags = "",
                },
            })

            -- Auto-open/close UI
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

            -- Keymaps (global)
            local map = vim.keymap.set
            map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
            map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Condition: ")) end,
                { desc = "DAP: Conditional breakpoint" })
            map("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
            map("n", "<leader>di", dap.step_into, { desc = "DAP: Step into" })
            map("n", "<leader>do", dap.step_over, { desc = "DAP: Step over" })
            map("n", "<leader>dO", dap.step_out, { desc = "DAP: Step out" })
            map("n", "<leader>dr", dap.restart, { desc = "DAP: Restart" })
            map("n", "<leader>dq", dap.terminate, { desc = "DAP: Terminate" })
            map("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
            map("n", "<leader>dR", function() require("dap").run_last() end, { desc = "DAP: Run last" })

            -- Go-specific debug helpers
            map("n", "<leader>dt", function() require("dap-go").debug_test() end, { desc = "DAP: Debug nearest Go test" })
            map("n", "<leader>dT", function() require("dap-go").debug_last() end, { desc = "DAP: Debug last Go test" })
        end,
    },
}

