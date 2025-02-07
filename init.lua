-- Declare the path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself as been cloned
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

-- Add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- Declare a few optionsn for lazy
local opts = {
    change_detection = {
        notify = false
    },
    checker = {
        enabled = true,
        notify = false
    }
}

-- Load the options from the config/ files
require("config.options")
require("config.keymaps")
require("config.autocmds")
-- Sets up lazy, this should always be last
require("lazy").setup("plugins", opts)

