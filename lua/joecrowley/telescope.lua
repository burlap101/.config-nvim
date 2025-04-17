local telescope = require("telescope")
local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")

telescope.setup {
	extensions = {
		undo = {
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.8,
			},
		}
	},
	defaults = {
		mappings = {
			i = {
				["<C-e>"] = function(prompt_bufnr)
					local picker = actions_state.get_current_picker(prompt_bufnr)
					local results = picker.finder.results

					local lines = {}
					for _, entry in ipairs(results) do
						table.insert(lines, entry.text)
					end
					print(vim.print(lines))

					-- Open a new buffer for editing
					vim.api.nvim_command("new")
					vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

					-- Close Telescope after processing
					actions.close(prompt_bufnr)
				end
			}
		}
	}
}
