local ts = vim.treesitter
local parsers = require("nvim-treesitter.parsers")
local parser = parsers.get_parser()
local ts_utils = require('nvim-treesitter.ts_utils')

local query =  '(call_expression function: ( identifier ) @name (#any-of? @name "useState" "useEffect")) @hook'

function selectHook(around)
  local parser = ts.get_parser()
  local tree = parser:parse()[1]
  local root = tree:root()
  local lang = parser:lang()
  local pos = vim.inspect_pos()

  local q = ts.query.parse(lang, query)
    for _, node, _ in q:iter_matches(root, 0) do
      local node_line = vim.treesitter.get_node_range(node):start()
      local current_cursor_line = vim.fn.line(".")
      if current_cursor_line <= node_line then
        ts_utils.update_selection(0, node[2])
        break
      end
    end
  end

  vim.api.nvim_set_keymap('o', 'ah', ':<c-u>lua selectHook(true)<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('o', 'ih', ':<c-u>lua selectHook()<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('x', 'ah', ':<c-u>lua selectHook(true)<cr>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('x', 'ih', ':<c-u>lua selectHook()<cr>', { noremap = true, silent = true })
