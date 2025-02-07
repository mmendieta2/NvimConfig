return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "dracula",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                ignore_focus = { "NvimTree" },
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },

            },
            sections = {
				-- display the current mode in section a
				lualine_a = { "mode" },
				-- display the current git branch, git differences, and any code diagnostics in section b
				lualine_b = { "branch", "diff", "diagnostics" },
				-- display the filename in section c
				lualine_c = { "filename" },
				-- display the file encoding type, os, and filetype in section x
				lualine_x = { "encoding", "fileformat", "filetype" },
				-- display where you are at in the file in section y
				lualine_y = { "progress" },
				-- display exact location of the cursor in section z
				lualine_z = { "location" },
			},
			-- Setup what each section will contain in inactive buffers
			inactive_sections = {
				-- display nothing in sections a and b
				lualine_a = {},
				lualine_b = {},
				-- display the file name in section c
				lualine_c = { "filename" },
				-- display the exact location of the cursor in section x
				lualine_x = { "location" },
				-- display nothing in sections y and z
				lualine_y = {},
				lualine_z = {},
			},
			-- Use default values for tabline, winbar, inactive winbar and extensions
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},			
        })
    end
}
