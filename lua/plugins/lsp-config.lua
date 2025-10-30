return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jdtls", "pyright" },
                automatic_installation = true,
                automatic_enable = false,
            })
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" }
            })
        end
    },
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

          

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("pyright")
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Code Hover Documentation" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Code Documentation" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "Code References" })
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "Code Implementations" })
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "Code Rename" })
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "Code Declaration" })
        end
    }
}
