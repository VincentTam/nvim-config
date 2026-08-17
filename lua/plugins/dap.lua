return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Initialize dap-ui
    dapui.setup()

    -- 1a. Define the GDB adapter
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
    }

    -- 1b. Define the CodeLLDB adapter (Server-based)
    dap.adapters.lldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb", -- Mason adds this binary to your PATH
        args = { "--port", "${port}" },
      },
    }

    -- 2a. Configure C file debugging with GDB
    local c_cpp_config_gdb = {
      {
        name = "Launch file (GDB)",
        type = "gdb",
        request = "launch",
        program = function()
          local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          -- Force conversion to full absolute path (e.g., /home/user/proj/main)
          return vim.fn.fnamemodify(path, ":p")
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
        -- Add this line to map current workspace to root relative paths:
        sourceFileMap = {
          ["${workspaceFolder}"] = "${workspaceFolder}"
        },
      },
    }

    -- 2b. Configure C file debugging with LLDB
    local c_cpp_config_lldb = {
      {
        name = "Launch file (CodeLLDB)",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    dap.configurations.c = c_cpp_config_lldb
    dap.configurations.cpp = c_cpp_config_lldb

    -- Automatically open/close DAP UI when starting/ending a debugging session
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Toggle Breakpoint remains on Leader + b
    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })

    -- Arrow key bindings from nvim-dap recommendations
    vim.keymap.set("n", "<S-Up>", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<S-Down>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<S-Right>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<S-Left>", dap.step_out, { desc = "Debug: Step Out" })

    -- Toggle UI
    vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })

    -- Evaluate the word under the cursor (or selected text in Visual mode) in a float
    vim.keymap.set({ "n", "v" }, "<Leader>de", function()
      dapui.eval()
    end, { desc = "Debug: Evaluate in Float" })

    -- Double-tap/Focus float: Pressing this will open and jump your cursor straight into the floating window
    vim.keymap.set("n", "<Leader>dE", function()
      dapui.eval(nil, { enter = true })
    end, { desc = "Debug: Evaluate and Focus Float" })

    -- Terminate the current debugging session
    vim.keymap.set("n", "<Leader>dq", function()
      dap.terminate()
    end, { desc = "Debug: Stop/Terminate Session" })

    -- Prompt for a condition string and set a conditional breakpoint on the current line
    vim.keymap.set("n", "<Leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Conditional Breakpoint" })
  end,
}
