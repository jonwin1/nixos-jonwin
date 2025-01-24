return {
    {
        'saghen/blink.cmp',

        dependencies = {
            'rafamadriz/friendly-snippets',
            "echasnovski/mini.nvim",
        },

        build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            keymap = { preset = 'default' },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                nerd_font_variant = 'mono'
            },

            completion = {
                -- Show documentation when selecting a completion item
                documentation = { auto_show = true, auto_show_delay_ms = 1000 },

                -- Display a preview of the selected item on the current line
                ghost_text = { enabled = true },

                -- Use mini.icons
                menu = {
                    draw = {
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return kind_icon
                                end,
                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            }
                        }
                    }
                }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
        opts_extend = { "sources.default" }
    }
}
