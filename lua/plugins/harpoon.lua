
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    local list = harpoon:list()

    -- Mark current file
    vim.keymap.set("n", "<leader>ha", function()
      list:add()
    end, { desc = "Harpoon Add File" })

    -- Toggle harpoon quick menu
    vim.keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = "Harpoon Toggle Menu" })
    
    vim.keymap.set("n", "<leader>hd", function()
        list:remove()
    end, {desc = "Harponn remove file"})

    -- Quick jump to files 1–5
    vim.keymap.set("n", "<leader>1", function() list:select(1) end, { desc = "Harpoon to 1" })
    vim.keymap.set("n", "<leader>2", function() list:select(2) end, { desc = "Harpoon to 2" })
    vim.keymap.set("n", "<leader>3", function() list:select(3) end, { desc = "Harpoon to 3" })
    vim.keymap.set("n", "<leader>4", function() list:select(4) end, { desc = "Harpoon to 4" })
    vim.keymap.set("n", "<leader>5", function() list:select(5) end, { desc = "Harpoon to 5" })
  end
}
