-- lua/plugins/productivity/code_runner.lua
require("code_runner").setup({
	filetype = {
		python = "python3",
	},
	term = {
		position = "below", -- Use toggleterm's bottom panel
		size = 15,
	},
	-- Optional: Floating window
	-- float = {
	--   border = "rounded",
	--   height = 0.4,
	--   width = 0.8,
	-- },
	on_job_completed = function()
		vim.defer_fn(function()
			if package.loaded["trouble"] then
				vim.cmd("TroubleRefresh")
			end
		end, 500)
	end,
})

vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Run Code" })
vim.keymap.set("n", "<leader>rt", function()
	local cr = require("code_runner")
	local current = cr.get_config().term.position
	if current == "below" then
		cr.setup({
			term = { position = "float", size = nil },
			float = { border = "rounded", height = 0.4, width = 0.8 },
		})
		vim.notify("CodeRunner: Switched to floating panel")
	else
		cr.setup({ term = { position = "below", size = 15 }, float = nil })
		vim.notify("CodeRunner: Switched to docked panel")
	end
end, { desc = "Toggle CodeRunner Panel Style" })
