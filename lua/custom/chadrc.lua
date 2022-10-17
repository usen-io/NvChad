local M = {}

M.plugins = {
    override = {

        ["williamboman/mason.nvim"] = {
            ensure_installed = {
                -- lua stuff
                "lua-language-server",
                "yaml-language-server",
                "python-lsp-server",
                "pylsp",
                "clangd",
                "ansible-language-server",
                "lua-language-server",
                "stylua",
                "json-lsp",
                "html-lsp",
                "cmake-language-server",
                "bash-language-server",

                -- web dev
                "css-lsp",
                "html-lsp",
                "json-lsp",

                -- shell
                "shfmt",
                "shellcheck",
            },
        },
    },

    user = {
        -- LSP configuration
        ["neovim/nvim-lspconfig"] = {
            config = function()
                require "plugins.configs.lspconfig"
                require "custom.plugins.lspconfig"
            end,
        },

        -- source code analysis and navigation tool
        ['ray-x/guihua.lua'] = {
            run = 'cd lua/fzy && make'
        },
        ['ray-x/navigator.lua'] = {
            after = "nvim-lspconfig",
            config = function()
                require('navigator').setup({
                    lsp = {
                        -- need to disable lsp here, as mason will install and handle it
                        disable_lsp = { 'all' },
                        -- format on save will cause issues if the code is not compatible, like windows c programs
                        format_on_save = false,
                        document_highlight = false,
                    },
                    mason = true,
                })
            end,
        },
    },
}

return M
