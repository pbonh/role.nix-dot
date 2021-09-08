" Split-Term Settings
" let g:split_term_vertical=0
  let g:disable_key_mappings=1
  command! XilinxTerm :Term env -i HOME="$HOME" csh
" nnoremap <Space>t :XilinxTerm<cr>
" Don't forget to run `p4 login -a`
