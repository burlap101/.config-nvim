local nnoremap = function(lhs, rhs, opts)
	vim.keymap.set('n', lhs, rhs, opts or {} )
end

local telescope_builtin = require('telescope.builtin')

nnoremap("<C-p>", function() 
	telescope_builtin.git_files()
end)

nnoremap("<leader>pf", function()
	telescope_builtin.find_files()
end)

nnoremap("<leader>ps", function()
	telescope_builtin.grep_string { search = vim.fn.input("Grep for > ")}
end)

nnoremap("<leader>pk", function()
	telescope_builtin.keymaps()
end)
