" let g:asyncrun_open = 6
" let g:asynctasks_term_pos="terminal"

" function! s:runner_proc(opts)
"   let curr_bufnr = floaterm#curr()
"   if has_key(a:opts, 'silent') && a:opts.silent == 1
"     call floaterm#hide()
"   endif
"   let cmd = 'cd ' . shellescape(getcwd())
"   call floaterm#terminal#send(curr_bufnr, [cmd])
"   call floaterm#terminal#send(curr_bufnr, [a:opts.cmd])
"   stopinsert
"   if &filetype == 'floaterm' && g:floaterm_autoinsert
"     call floaterm#util#startinsert()
"   endif
" endfunction
" 
" let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
" let g:asyncrun_runner.floaterm = function('s:runner_proc')

" function! s:fzf_task_sink(what)
" 	let p1 = stridx(a:what, '<')
" 	if p1 >= 0
" 		let name = strpart(a:what, 0, p1)
" 		let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
" 		if name != ''
" 			exec "AsyncTask ". fnameescape(name)
" 		endif
" 	endif
" endfunction
" 
" function! s:fzf_task()
" 	let rows = asynctasks#source(&columns * 48 / 100)
" 	let source = []
" 	for row in rows
" 		let name = row[0]
" 		let source += [name . '  ' . row[1] . '  : ' . row[2]]
" 	endfor
" 	let opts = { 'source': source, 'sink': function('s:fzf_task_sink'),
" 				\ 'options': '+m --nth 1 --inline-info --tac' }
" 	if exists('g:fzf_layout')
" 		for key in keys(g:fzf_layout)
" 			let opts[key] = deepcopy(g:fzf_layout[key])
" 		endfor
" 	endif
" 	call fzf#run(opts)
" endfunction
" 
" command! -nargs=0 AsyncTaskFzf call s:fzf_task()
" nnoremap <C-t> :AsyncTaskFzf<cr>
" nnoremap <C-t> :AsyncRun -mode=term -pos=floaterm -focus=0  ls -la
