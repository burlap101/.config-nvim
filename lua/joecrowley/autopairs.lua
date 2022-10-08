local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
	map_cr=false,
	enable_check_bracket_line = false
})

npairs.clear_rules()

npairs.add_rules({
	Rule('{', '}'): end_wise(function() return true end),
	Rule('(', ')'): end_wise(function() return true end),
	Rule('[', ']'): end_wise(function() return true end),
})



-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
 if vim.fn.pumvisible() ~= 0  then
   return vim.fn["coc#_select_confirm"]()
 else
   return npairs.autopairs_cr()
 end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
