-- This file can be merged into your existing lsp.lua or required separately.

return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Extend existing gopls config (assuming already defined)
            local existing = vim.lsp.config.gopls or {}
            vim.lsp.config.gopls = vim.tbl_deep_extend("force", existing, {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            shadow = true,
                            nilness = true,
                            unusedwrite = true,
                            unusedvariable = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                        codelenses = {
                            gc_details = false,
                            generate = true,
                            regenerate_cgo = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true,
                            test = true,
                        },
                        semanticTokens = true,
                        directoryFilters = { "-vendor" },
                        usePlaceholders = true,
                    },
                },
            })

            -- Autocmd to refresh code lenses for Go
            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold" }, {
                pattern = "*.go",
                callback = function()
                    pcall(vim.lsp.codelens.refresh)
                end,
            })

            -- Inlay hints toggle
            local hints_enabled = true
            vim.keymap.set("n", "<leader>gh", function()
                hints_enabled = not hints_enabled
                vim.lsp.inlay_hint(0, hints_enabled)
                vim.notify("Go Inlay hints: " .. (hints_enabled and "ON" or "OFF"))
            end, { desc = "Go: Toggle inlay hints" })

            -- Code lens run (e.g. test)
            vim.keymap.set("n", "<leader>gl", function()
                vim.lsp.codelens.run()
            end, { desc = "Go: Run code lenses" })

            -- Organize imports (using gopls)
            vim.keymap.set("n", "<leader>gi", function()
                vim.lsp.buf.execute_command({
                    command = "gopls.organizeImports",
                    arguments = { vim.api.nvim_buf_get_name(0) },
                })
                vim.lsp.buf.format({ async = true })
            end, { desc = "Go: Organize imports" })
        end,
    },
}
