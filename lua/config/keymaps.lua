-- Set <leader> key to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove seach highlight after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })
vim.keymap.set("n", "<leader><Down>", ":resize -2<CR>", {desc = "Decrease height"})
vim.keymap.set("n", "<leader><Up>", ":resize +2<CR>", {desc = "Increase height"})
vim.keymap.set("n", "<leader><Left>", ":vertical resize -2<CR>", {desc = "Decrease width"})
vim.keymap.set("n", "<leader><Right>", ":vertical resize +2<CR>", {desc = "Increase width"})

-- Easy window split
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", {desc = "window split vertical"})
vim.keymap.set("n", "<leader>wh", ":split<cr>", {desc = "window split horizontal"})
vim.keymap.set("n", "<leader>wt", function()
    vim.cmd("split | resize 10 |terminal")
end, {desc = "Split window horizontally with termimal opened"})

vim.keymap.set("n", "<leader>cc", function()
    local buftype = vim.bo.buftype
    if buftype == "terminal" then
        vim.cmd("bwipeout!")
    else
        vim.api.nvim_win_close(0, false)
    end
end, {desc = "Close current window"})

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left in visual mode" })

-- Run python code in nvim
vim.keymap.set("n", "<leader>rp", function()
  vim.cmd("w")  -- Save file
  vim.cmd("belowright split | resize 10")  -- Open split below
  vim.cmd("term python3 " .. vim.fn.expand("%"))  -- Run Python in terminal
end)


