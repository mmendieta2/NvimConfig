return {
    "nvim-tree/nvim-tree.lua",
    config = function() 
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Explorer"})
        require("nvim-tree").setup({
            hijack_netrw = true,
            auto_reload_on_write = true,
            git = {
                enable = false,
            },
            view = {
                width = 30,
                adaptive_size = true,
            },
            update_focused_file = {
                enable = false,
            }
        })
    end
}
