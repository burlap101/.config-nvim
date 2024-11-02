local auto_save = require "auto-save"

local excluded_filetypes = {"gitrebase", "gitcommit", "oil"}

auto_save.setup({
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")
		if
			fn.getbufvar(buf, "&modifiable") == 1 and
			utils.not_in(fn.getbufvar(buf, "&filetype"), excluded_filetypes) then
			return true
		end
		return false
	end,
})
