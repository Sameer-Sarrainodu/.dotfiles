-- lua/plugins/core/dap.lua
local dap = require("dap")
local dapui = require("dapui")

-- =====================================================
-- 1️⃣ DAP log level
-- Only show errors
-- =====================================================
dap.set_log_level("ERROR")

-- =====================================================
-- 2️⃣ Adapter: Python via Mason debugpy
-- =====================================================
local mason_debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"

dap.adapters.python = {
	type = "executable",
	command = mason_debugpy,
	args = { "-m", "debugpy.adapter" },
}

-- =====================================================
-- 3️⃣ Python configuration
-- =====================================================
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		-- Use venv if present, else fallback to Mason debugpy Python
		pythonPath = function()
			local venv = os.getenv("VIRTUAL_ENV")
			if venv then
				return venv .. "/bin/python"
			end
			return mason_debugpy
		end,
	},
}

-- =====================================================
-- 4️⃣ Automatically open/close DAP UI
-- =====================================================
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- =====================================================
-- 5️⃣ Keymaps for DAP
-- =====================================================
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open DAP REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last DAP" })

-- Added: Keymap to toggle DAP UI for Debug tab
vim.keymap.set("n", "<leader>du", ":lua require('dapui').toggle()<CR>", { desc = "Toggle Debug UI" })
