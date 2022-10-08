lua require("joecrowley")

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files({ show_untracked = true })<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('joecrowley.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>gc :lua require('joecrowley.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
nnoremap <leader>td :lua require('joecrowley.telescope').dev()<CR>
nnoremap <leader>pt :lua require('telescope.builtin').treesitter()<CR>
