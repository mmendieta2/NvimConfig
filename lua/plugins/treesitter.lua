return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag"
    },
    build = ":TSUpdate",
    config = function()
        local ts_config = require("nvim-treesitter.configs")
        ts_config.setup({
            ensure_installed = {"java", "vim", "vimdoc", "lua", "javascript", "typescript", "html", "css", "json", "tsx", "markdown", "markdown_inline", "gitignore"},
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            autotag = {enable = true}
        })
    end
}
