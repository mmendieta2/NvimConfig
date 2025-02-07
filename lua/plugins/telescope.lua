return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local builtin = require("telescope.builtin")
            -- Keymap to search with file names
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
            -- Keymap to search files with text within files
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
            -- Keymap for diagnostics
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
            -- Keymap to resume search
            vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Finder Resume" })
            -- Keymap to search for recent files
            vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Find Recent Files" })
            -- Keymap to search for open buffers
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Existing Buffers" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                mappings = {
                    i = {
                        -- next option
                        ["<C-n>"] = actions.cycle_history_next,
                        -- previous option
                        ["<C-p>"] = actions.cycle_history_prev,
                        -- next preview
                        ["<C-j>"] = actions.move_selection_next,
                        -- previous preview
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                require("telescope").load_extension("ui-select")
            })
        end
    }
}
