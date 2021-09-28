let g:floaterm_width = 0.8
let g:floaterm_height = 0.9
let g:floaterm_position = 'center'
let g:floaterm_autoclose = 1
let g:floaterm_autoinsert = v:true
let g:floaterm_opener = 'edit'
let g:floaterm_keymap_toggle = '<C-\>'
"nnoremap <C-\> :FloatermNew<cr>
"nnoremap S :FloatermToggle<cr>
"nnoremap <C-t> :FloatermNew ranger<cr>
nnoremap <C-s> :FloatermNew<cr>
"nnoremap <C-n> :FloatermNew lazygit<cr>
"nnoremap <C-p> :FloatermNew ranger<cr>
command! FloatermLazygit :FloatermNew lazygit
command! FloatermRanger :FloatermNew ranger
command! FloatermBroot :FloatermNew broot
nnoremap <silent> <leader>g :FloatermLazygit<CR>
nnoremap <silent> <leader>r :FloatermRanger<CR>
nnoremap <silent> <leader>b :FloatermBroot<CR>
"nnoremap S :CocList floaterm<cr>
"nnoremap _ :FloatermToggle<cr>
"let g:floaterm_keymap_toggle = '_'
"tnoremap <C-\> <C-\><C-n>S
"inoremap <C-\> <C-[>:FloatermNew<cr>
"let g:floaterm_winblend = '1'
"hi FloatermNF guibg=black
"hi FloatermBorderNF guibg=blue guifg=white
" Set floaterm window's background to black
"hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=gray guifg=orange
hi FloatermNC guibg=gray
