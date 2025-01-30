return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            "saghen/blink.cmp",
        },

        opts = {
            servers = {
                clangd = {
                    capabilities = {
                        offsetEncoding = { "utf-16" },
                    },
                },
                cmake = {},
                hls = {},
                lua_ls = {},
                nixd = {},
                sqls = {},
                texlab = {},
                typos_lsp = {},
            }
        },

        config = function(_, opts)
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    -- Helper function for binding keys
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
                    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
                    map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
                    map("gr", require("telescope.builtin").lsp_references, "Goto References")

                    map("<leader>f", function() vim.lsp.buf.format() end, "Format file")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
                    map("<leader>cr", vim.lsp.buf.rename, "Rename")

                    map("<leader>j", "<cmd>cnext<CR>zz", "Go to next error")
                    map("<leader>k", "<cmd>cprev<CR>zz", "Go to previous error")
                    map("<leader>n", "<cmd>lnext<CR>zz", "Go to next location")
                    map("<leader>p", "<cmd>lprev<CR>zz", "Go to previous location")

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight',
                            { clear = false })
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd('LspDetach', {
                            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                            end,
                        })
                    end
                end
            })

            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- opts[server].capabilities, if you've defined it
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end,
    },
}
