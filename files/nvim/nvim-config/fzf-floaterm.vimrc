nnoremap <leader>s :Floaterms<cr>
xnoremap <leader>s :Floaterms<cr>
let g:fzf_floaterm_newentries = {
  \ '+lazygit' : {
    \ 'title': 'Lazygit',
    \ 'cmd': 'lazygit' },
  \ '+zsh' : {
    \ 'title': 'Zsh Shell',
    \ 'cmd': 'zsh' },
  \ '+ranger' : {
    \ 'title': 'Ranger File Manager',
    \ 'cmd': 'ranger' },
  \ '+pwsh' : {
    \ 'title': 'Powershell',
    \ 'cmd': 'pwsh' }
  \ }
