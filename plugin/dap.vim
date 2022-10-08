nnoremap <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>B :lua require'dap'.clear_breakpoints()<CR>
nnoremap <F5> :lua require'dap'.continue()<CR>
nnoremap <F6> :lua require'dap'.step_over()<CR>
nnoremap <F7> :lua require'dap'.step_into()<CR>
nnoremap <F8> :lua require'dap'.step_out()<CR>
nnoremap <F4> :lua require'dap'.terminate()<CR>
