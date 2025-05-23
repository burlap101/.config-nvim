local cmp = require("cmp")
local ls = require("luasnip")

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- some other good icons
local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible_docs() then
				cmp.close_docs()
			elseif not cmp.visible_docs() then
				cmp.open_docs()
			else
				fallback()
			end
		end, { "i", "c" }),
		--["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c", "n" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c", "n" }),
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.mapping.confirm { select = true },
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm { select = false },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif ls.expandable() then
				ls.expand()
			elseif ls.expand_or_jumpable() then
				ls.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"s",
		}),
		["<C-n>"] = cmp.mapping(function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, {
			"s",
			"i",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif ls.jumpable(-1) then
				ls.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {

		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[NVIM_LUA]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
}

-- Custom snippets
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt")
local events = require("luasnip.util.events")

ls.add_snippets("lua", {
	s(
		'lu = require("luaunit") ...',
		fmt.fmt('local lu = require("luaunit")\n\n{}\n\nos.exit(lu.LuaUnit.run())', { i(0) }),
		{
			callbacks = {
				[-1] = {
					[events.pre_expand] = function(node, _event_args) vim.api.nvim_del_current_line() end
				}
			}
		}
	),
})

ls.add_snippets("python", {
	s(
		'x for x in xs if cond',
		fmt.fmt('{} for {} in {} if {}', { i(1, "x"), i(2, "x"), i(3, "xs"), i(0, "cond") })
	)
})
