function selectHook(around)
  local hooks = {
    'useState',
    'useEffect',
    'useContext',
    'useReducer',
    'useCallback',
    'useMemo',
    'useRef',
    'useImperativeHandle',
    'useLayoutEffect',
    'useDebugValue',
    'useDeferredValue',
    'useTransition',
    'useId'
  }
  local last = vim.api.nvim_buf_line_count(0)
  local lines = vim.fn.getline(0, last)

  for _, hook in pairs(hooks) do
    for _, line in pairs(lines) do
      if vim.fn.match(line, hook .. '(') ~= -1 then 
        vim.api.nvim_win_set_cursor(0, {_, 0})
        if around then
          vim.cmd("normal! V$%")
        else
          vim.cmd("normal! f(vi(")
        end
      end
    end
  end
end

vim.api.nvim_set_keymap('o', 'ah', ':<c-u>lua selectHook(true)<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'ih', ':<c-u>lua selectHook()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'ah', ':<c-u>lua selectHook(true)<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'ih', ':<c-u>lua selectHook()<cr>', { noremap = true, silent = true })
