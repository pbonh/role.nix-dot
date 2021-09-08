"call coc#config('languageserver', {
"        \ 'ccls': {
"        \     "command": "ccls",
"        \     "trace.server": "verbose",
"        \     "filetypes": ["c", "cpp", "objc", "objcpp"],
"        \     "rootPatterns": [".ccls-root", "compile_commands.json"],
"        \     "initializationOptions": {
"        \         "cache": {
"        \              "directory": ".ccls-cache"
"        \          },
"        \          "client": {
"        \              "snippetSupport": true
"        \          },
"        \          "highlight": { "lsRanges" : true }
"        \     }
"        \ }
"   "languageserver": {
"       "ccls": {
"           "command": "ccls",
"           "trace.server": "verbose",
"           "filetypes": ["h", "hpp", "c", "cc", "cpp", "objc", "objcpp"],
"           "rootPatterns": [".ccls-root", "compile_commands.json"],
"           "initializationOptions": {
"               "cache": {
"                   "directory": ".ccls-cache"
"               },
"               "client": {
"                   "snippetSupport": true
"               },
"               "clang": {
"                   "excludeArgs": ["-Wall", "-Werror"],
"                   "extraArgs": ["-ferror-limit=0", "--gcc-toolchain=/opt/rh/devtoolset-2/root/usr"]
"               },
"               "highlight": { "lsRanges" : true }
"           }
"        \})
"call coc#config('clangd', {
"                    \   "enabled": true,
"                    \   "arguments": [
"                    \       "--background-index",
"                    \       "--pch-storage=memory",
"                    \       "--limit-results=0",
"                    \       "--j=4",
"                    \       "--all-scopes-completion"
"                    \   ],
"                    \   "semanticHighlighting": true
"                    \})

autocmd FileType cpp let b:coc_root_patterns = ['.git', '.svn', 'CMakeLists.txt']
autocmd FileType hpp let b:coc_root_patterns = ['.git', '.svn', 'CMakeLists.txt']
autocmd FileType cc let b:coc_root_patterns = ['.git', '.svn', 'CMakeLists.txt']
autocmd FileType h let b:coc_root_patterns = ['.git', '.svn', 'CMakeLists.txt']

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"nnoremap <silent> gs  :<C-u>CocList -I outline<cr>
"nnoremap <silent> gS :<C-u>CocList -I symbols<cr>
"nnoremap <silent> gs  :Clap coc_outline<cr>
"nnoremap <silent> gS :Clap coc_symbols<cr>
nnoremap <silent> g/  :CocFzfList outline<cr>
nnoremap <silent> gS :CocFzfList symbols<cr>

" nn <silent> K :call CocActionAsync('doHover')<cr>
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" Highlight symbol under cursor on CursorHold

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" Search workspace symbols
"nnoremap <silent> <C-_> :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>n

" " CCLS Settings
" au CursorHold * sil call CocActionAsync('highlight')
" au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
" " bases
" nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" " bases of up to 3 levels
" nn <silent> xB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" " derived
" nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" " derived of up to 3 levels
" nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>
" 
" " caller
" nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" " callee
" nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>
" 
" " $ccls/member
" " member variables / variables in a namespace
" nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" " member functions / functions in a namespace
" nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" " nested classes / types in a namespace
" nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>
" 
" nmap <silent> xt <Plug>(coc-type-definition)<cr>
" nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
" nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>
" 
" nn xx x
