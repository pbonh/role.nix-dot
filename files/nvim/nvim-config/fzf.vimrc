" FZF
  set rtp+=~/.fzf
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" nnoremap <C-Space> :Files<cr>
  nnoremap <Space>f :Files<cr>
  nnoremap <Space>b :Buffers<cr>

" command! -bang -nargs=* GGrep
" \ call fzf#vim#grep(
" \   'git grep --line-number '.shellescape(<q-args>), 0,
" \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction
  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
  command! -nargs=* -bang RGCWord call RipgrepFzf(expand('<cword>'), <bang>0)
  nnoremap <C-_> :RG<cr>
" nnoremap <C-_> :Rg<cr>

  nnoremap : :Commands<cr>

  function! s:fzf_sink(what)
      let p1 = stridx(a:what, '<')
      if p1 >= 0
          let name = strpart(a:what, 0, p1)
          let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
          if name != ''
              exec "AsyncTask ". fnameescape(name)
          endif
      endif
  endfunction

  function! s:fzf_task()
      let rows = asynctasks#source(&columns * 48 / 100)
      let source = []
      for row in rows
          let name = row[0]
          let source += [name . '  ' . row[1] . '  : ' . row[2]]
      endfor
      let opts = { 'source': source, 'sink': function('s:fzf_sink'),
                  \ 'options': '+m --nth 1 --inline-info --tac' }
      if exists('g:fzf_layout')
          for key in keys(g:fzf_layout)
              let opts[key] = deepcopy(g:fzf_layout[key])
          endfor
      endif
      call fzf#run(opts)
  endfunction

  command! -nargs=0 AsyncTaskFzf call s:fzf_task()
  nnoremap <leader>t :AsyncTaskFzf<cr>

" function! SelectTargetFloat(...)
"     return fzf#run({
"                 \ 'source': cmake4vim#GetAllTargets(),
"                 \ 'options': '+m -n 1 --prompt CMakeTarget\>\ ',
"                 \ 'window': { 'width': 0.9, 'height': 0.6 },
"                 \ 'sink':    function('cmake4vim#SelectTarget')})
" endfunction
" command! -bang -nargs=* FZFCMakeSelectTargetFloat call SelectTargetFloat(<q-args>, <bang>0)
" nnoremap <C-q> :FZFCMakeSelectTargetFloat<cr>
"" This is the default extra key bindings
"  autocmd FileType fzf tnoremap <buffer> <C-p> <Down>
"  autocmd FileType fzf tnoremap <buffer> <C-n> <Up>
"  "tnoremap <C-p> <Down>
"  "tnoremap <C-n> <Up>
"  let g:fzf_action = {
"    \ 'ctrl-t': 'tab split',
"    \ 'ctrl-x': 'split',
"    \ 'ctrl-v': 'vsplit' }
"" Default fzf layout
"" - down / up / left / right
"  let g:fzf_layout = { 'up': '~30%' }
"" In Neovim, you can set up fzf window using a Vim command
"  "let g:fzf_layout = { 'window': 'enew' }
"  "let g:fzf_layout = { 'window': '-tabnew' }
"" Customize fzf colors to match your color scheme
"  let g:fzf_colors =
"  \ { 'fg':      ['fg', 'Normal'],
"    \ 'bg':      ['bg', 'Normal'],
"    \ 'hl':      ['fg', 'Comment'],
"    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"    \ 'hl+':     ['fg', 'Statement'],
"    \ 'info':    ['fg', 'PreProc'],
"    \ 'prompt':  ['fg', 'Conditional'],
"    \ 'pointer': ['fg', 'Exception'],
"    \ 'marker':  ['fg', 'Keyword'],
"    \ 'spinner': ['fg', 'Label'],
"    \ 'header':  ['fg', 'Comment'] }
"" Enable per-command history.
"" CTRL-N and CTRL-P will be automatically bound to next-history and
"" previous-history instead of down and up. If you don't like the change,
"" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
"  "let g:fzf_history_dir = '~/.local/share/fzf-history'
"" [Buffers] Jump to the existing window if possible
"  let g:fzf_buffers_jump = 1
"" [[B]Commits] Customize the options used by 'git log':
"  let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"" Command for git grep
"" - fzf#vim#grep(command, with_column, [options], [fullscreen])
"  command! -bang -nargs=* GGrep
"    \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
"" Override Colors command. You can safely do this in your .vimrc as fzf.vim
"" will not override existing commands.
"  command! -bang Colors
"    \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
"" Augmenting Ag command using fzf#vim#with_preview function
""   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
""     * For syntax-highlighting, Ruby and any of the following tools are required:
""       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
""       - CodeRay: http://coderay.rubychan.de/
""       - Rouge: https://github.com/jneen/rouge
""
""   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
""   :Ag! - Start fzf in fullscreen and display the preview window above
"  "command! -bang -nargs=* Ag
"  "  \ call fzf#vim#ag(<q-args>,
"  "  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"  "  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"  "  \                 <bang>0)
"" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
"  command! -bang -nargs=* Rg
"    \ call fzf#vim#grep(
"    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"    \   <bang>0 ? fzf#vim#with_preview('up:60%')
"    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"    \   <bang>0)
"" Likewise, Files command with preview window
"  command! -bang -nargs=? -complete=dir Files
"    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"  command! -bang -nargs=? -complete=dir GFiles
"    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"  command! -bang -nargs=? -complete=dir Buffers
"    \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview(), <bang>0)
"" Mapping selecting mappings
"  nmap <leader><tab> <plug>(fzf-maps-n)
"  xmap <leader><tab> <plug>(fzf-maps-x)
"  omap <leader><tab> <plug>(fzf-maps-o)
"" Insert mode completion
"  imap <c-x><c-k> <plug>(fzf-complete-word)
"  imap <c-x><c-f> <plug>(fzf-complete-path)
"  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"  imap <c-x><c-l> <plug>(fzf-complete-line)
"" Advanced customization using autoload functions
"  "inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
"" Key Mappings
"  "nnoremap <C-f> :GFiles<cr>
"  "nnoremap <C-b> :Buffers<cr>
"  "vnoremap <C-f> :GFiles<cr>
"  "vnoremap <C-b> :Buffers<cr>
"
