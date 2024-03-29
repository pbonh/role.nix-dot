"if has('autocmd')
"  augroup WincentAutocomplete
"    autocmd!
"    autocmd! User UltiSnipsEnterFirstSnippet
"    autocmd User UltiSnipsEnterFirstSnippet call autocomplete#setup_mappings()
"    autocmd! User UltiSnipsExitLastSnippet
"    autocmd User UltiSnipsExitLastSnippet call autocomplete#teardown_mappings()
"  augroup END
"endif
"
" -----------------------------------------------------------------------------
""Taken from Github
"" Don't map any tabs, I'll do it later
"let g:UltiSnipsExpandTrigger = '<NOP>'
"let g:UltiSnipsJumpForwardTrigger = '<NOP>'
"let g:UltiSnipsJumpBackwardTrigger = '<NOP>'
"let g:SuperTabMappingForward = '<NOP>'
"let g:SuperTabMappingBackward = '<NOP>'
"" Don't unmap my mappings
"let g:UltiSnipsMappingsToIgnore = [ "SmartTab", "SmartShiftTab" ]
"
"" Make <CR> smart
"let g:ulti_expand_res = 0
"function! Ulti_ExpandOrEnter()
"  " First try to expand a snippet
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res
"    " if successful, just return
"    return ''
"  elseif pumvisible()
"    " if in completion menu - just close it and leave the cursor at the
"    " end of the completion
"    return deoplete#mappings#close_popup()
"  else
"    " otherwise, just do an "enter"
"    return "\<return>"
"  endif
"endfunction
"inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
"
"" Enable tabbing and shift-tabbing through list of results
"function! g:SmartTab()
"  if pumvisible()
"    return SuperTab("n")
"  else
"    call UltiSnips#JumpForwards()
"    if g:ulti_jump_forwards_res == 0
"      return SuperTab("n")
"    endif
"    return ''
"  endif
"endfunction
"inoremap <silent> <tab> <C-R>=g:SmartTab()<cr>
"snoremap <silent> <tab> <Esc>:call g:SmartTab()<cr>
"
"function! g:SmartShiftTab()
"  if pumvisible()
"    return SuperTab("p")
"  else
"    call UltiSnips#JumpBackwards()
"    if g:ulti_jump_backwards_res == 0
"      return SuperTab("p")
"    endif
"    return ''
"  endif
"endfunction
"inoremap <silent> <s-tab> <C-R>=g:SmartShiftTab()<cr>
"snoremap <silent> <s-tab> <Esc>:call g:SmartShiftTab()<cr>
"" -----------------------------------------------------------------------------
