" let g:Lf_StlSeparator = { 'left': '', 'right': '' }
" let g:Lf_WildIgnore = {
"   \ 'dir': ['.build*', 'build', 'build64', '.git', '.svn', '.clangd', '.*ccls*', 'Debug', 'Release', 'RelWithDebInfo'],
"   \ 'file': []
"   \}
" let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_UseCache = 0
" let g:Lf_UseMemoryCache = 0
"
"" AsyncTask
"function! s:lf_task_source(...)
"	let rows = asynctasks#source(&columns * 48 / 100)
"	let source = []
"	for row in rows
"		let name = row[0]
"		let source += [name . '  ' . row[1] . '  : ' . row[2]]
"	endfor
"	return source
"endfunction
"
"
"function! s:lf_task_accept(line, arg)
"	let pos = stridx(a:line, '<')
"	if pos < 0
"		return
"	endif
"	let name = strpart(a:line, 0, pos)
"	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
"	if name != ''
"		exec "AsyncTask " . name
"	endif
"endfunction
"
"function! s:lf_task_digest(line, mode)
"	let pos = stridx(a:line, '<')
"	if pos < 0
"		return [a:line, 0]
"	endif
"	let name = strpart(a:line, 0, pos)
"	return [name, 0]
"endfunction
"
"function! s:lf_win_init(...)
"	setlocal nonumber
"	setlocal nowrap
"endfunction
"
"
"let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
"let g:Lf_Extensions.task = {
"			\ 'source': string(function('s:lf_task_source'))[10:-3],
"			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
"			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
"			\ 'highlights_def': {
"			\     'Lf_hl_funcScope': '^\S\+',
"			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
"			\ },
"		\ }
"
"nnoremap <C-t> :Leaderf --fuzzy --nowrap task<cr>

" Floaterm
" function! s:lf_floaterm_source(...)
"   let candidates = []
"   let bufs = floaterm#buflist#gather()
"   for bufnr in bufs
"     let bufinfo = getbufinfo(bufnr)[0]
"     let name = bufinfo['name']
"     let title = getbufvar(bufnr, 'term_title')
"     let line = printf('    %s    %s    %s', bufnr, name, title)
"     call add(candidates, line)
"   endfor
"   return candidates
" endfunction
" 
" function! s:lf_floaterm_accept(line, arg) abort
"   let bufnr = str2nr(matchstr(a:line, '\S'))
"   call floaterm#terminal#open_existing(bufnr)
" endfunction
" 
" function! s:lf_floaterm_preview(orig_buf_nr, orig_cursor, line, args) abort
"   let bufnr = str2nr(matchstr(a:line, '\S'))
"   let lnum = getbufinfo(bufnr)[0]['lnum']
"   return [bufnr, lnum, '']
" endfunction
" 
" let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
" let g:Lf_Extensions.floaterm = {
" 			\ 'source': string(function('s:lf_floaterm_source'))[10:-3],
" 			\ 'accept': string(function('s:lf_floaterm_accept'))[10:-3],
"             \ 'preview': string(function('s:lf_floaterm_preview'))[10:-3],
" 		\ }
" 
" nnoremap S :Leaderf --fuzzy --nowrap floaterm<cr>

" " Cmake4Vim
" function! s:lf_cmake4vim_accept(line, arg)
"         silent call cmake4vim#SelectTarget(g:cmake_build_target)
" endfunction
" 
" let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
" let g:Lf_Extensions.cmake4vim = {
" 			\ 'source': cmake4vim#GetAllTargets(),
" 			\ 'accept': function('s:lf_cmake4vim_accept'),
" 			\ 'highlights_def': {
" 			\     'Lf_hl_funcScope': '^\S\+',
" 			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
" 			\ },
" 		\ }
" 
" nnoremap <C-q> :Leaderf --fuzzy --nowrap cmake4vim<cr>
