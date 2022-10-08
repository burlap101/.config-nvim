require("joecrowley.telescope")
require("joecrowley.autopairs")
require("joecrowley.dap")
require("joecrowley.cmp")
require("joecrowley.lsp")
require("joecrowley.comment")
require("joecrowley.surround")
-- require("joecrowley.catpuccin")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

