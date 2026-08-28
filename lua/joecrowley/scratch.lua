local M = {}

local scratch_buf = nil

local function open_scratch(side)
	-- Reuse existing buffer if still valid
	if scratch_buf and vim.api.nvim_buf_is_valid(scratch_buf) then
		-- If already visible, just focus it
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if vim.api.nvim_win_get_buf(win) == scratch_buf then
				vim.api.nvim_set_current_win(win)
				return
			end
		end
	else
		-- Create a new scratch buffer
		scratch_buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_name(scratch_buf, "scratch")
		vim.bo[scratch_buf].buftype = "nofile"
		vim.bo[scratch_buf].bufhidden = "hide" -- keep buffer alive on window close
		vim.bo[scratch_buf].swapfile = false
		vim.bo[scratch_buf].filetype = "markdown"
	end

	-- Width: 50% of total columns, capped at 150
	local width = math.min(math.floor(vim.o.columns * 0.35), 50)

	-- "right" arg → botright (right side), default → topleft (left side)
	local placement = (side == "right") and "botright" or "topleft"
	vim.cmd(placement .. " " .. width .. "vsplit")
	local win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, scratch_buf)

	-- Window-local options
	vim.wo[win].number = false
	vim.wo[win].relativenumber = false
	vim.wo[win].signcolumn = "no"
	vim.wo[win].wrap = true
	vim.wo[win].linebreak = true

	-- ZZ closes the window only, does not delete the buffer
	vim.keymap.set("n", "ZZ", "<C-w>c", { buffer = scratch_buf, nowait = true, desc = "Close scratch window" })
	-- q also closes the window
	vim.keymap.set("n", "q", "<C-w>c", { buffer = scratch_buf, nowait = true, desc = "Close scratch window" })
end

M.open = open_scratch

-- :Scratch [right]
vim.api.nvim_create_user_command("Scratch", function(opts)
	local side = opts.args ~= "" and opts.args or nil
	open_scratch(side)
end, {
	nargs = "?",
	complete = function() return { "right" } end,
	desc = "Open scratch pad (default: left, :Scratch right for right side)",
})

return M
