-- ~/.config/nvim/lua/config/mvn_compile_toggle.lua

local M = {}

-- Table to track files marked for auto mvn compile
local maven_compile_files = {}

-- Create autocommand group
local group = vim.api.nvim_create_augroup("MavenCompileToggle", { clear = true })

-- Autocommand: on save, run mvn compile if file is marked
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = "*",
  callback = function()
    local file = vim.fn.fnamemodify(vim.fn.expand("<afile>"), ":p")
    if maven_compile_files[file] then
      vim.fn.jobstart("mvn compile", {
        on_stdout = function(_, data)
          if data then
            --print(table.concat(data, "\n"))
          end
        end,
        on_stderr = function(_, data)
        end,
      })
    end
  end,
})

-- Command to toggle current file for mvn compile on save
vim.api.nvim_create_user_command("ToggleMvnCompile", function()
  local file = vim.fn.expand("%:p")
  if maven_compile_files[file] then
    maven_compile_files[file] = nil
    print("Disabled mvn compile on save for " .. file)
  else
    maven_compile_files[file] = true
    print("Enabled mvn compile on save for " .. file)
  end
end, {})

-- Optional: function to expose current status
function M.is_marked(file)
  return maven_compile_files[file or vim.fn.expand("%:p")]
end

vim.keymap.set("n", "<leader>m", ":ToggleMvnCompile<CR>", { desc = "Toggle mvn compile on save" })
return M
