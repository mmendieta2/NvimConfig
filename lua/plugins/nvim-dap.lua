return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function() 
        local dap = require("dap")

        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Launch current file",
            program = "${file}", -- run the current file
            console = "integratedTerminal",
          },
        }
            
        
        dap.configurations.java = {
            {
                type = "java",
                request = "launch",
                name = "Launch Java File",
                mainClass = function()
                    return vim.fn.input("Main class > ", "", "file")
                end,
                projectName = function()
                    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                end,
                cwd = vim.fn.getcwd(),
                console = "integratedTerminal",
            }
        }

        local dapui = require("dapui")
        local dap_python = require("dap-python")

        require("dapui").setup({})
        require("nvim-dap-virtual-text").setup({
            commented = true,
        })

        -- dap_python.setup(vim.fn.exepath("python3"))
        dap_python.setup("~/.venvs/nvim-dap/bin/python")

        vim.fn.sign_define("DapBreakpoint", {
            text = "●",
            texthl = "DiagnosticSignError",
            linehl = "",
            numhl = "",
        })

        vim.fn.sign_define("DapBreakpointRejected", {
            text = "×",
            texthl = "DiagnosticSignError",
            linehl = "",
            numhl = "",
        })
        
        vim.fn.sign_define("DapStopped", {
            text = "▶",
            texthl = "DiagnosticSignError",
            linehl = "Visual",
            numhl = "DiagnosticSignWarn",
        })
        
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "<leader>db", function()
            dap.toggle_breakpoint()
        end, opts)

        vim.keymap.set("n", "<leader>dc", function ()
            dap.continue()
        end, opts)

        vim.keymap.set("n", "<leader>do", function()
            dap.step_over()
        end, opts)

        vim.keymap.set("n", "<leader>di", function()
            dap.step_into()
        end, opts)

        vim.keymap.set("n", "<leader>dO", function()
            dap.step_out()
        end, opts)

        vim.keymap.set("n", "<leader>dq", function()
            require("dap").terminate()
        end, opts)

        vim.keymap.set("n", "<leader>du", function()
            dapui.toggle()
        end, opts)
    end
}
