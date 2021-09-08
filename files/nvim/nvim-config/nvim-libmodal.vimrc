"lua << EOF
"
"local libmodal = require('libmodal')
"
"local function spaceMode()
"    local userInput = string.char(
"        vim.api.nvim_get_var('spaceModeInput')
"    )
"
"    if userInput == 'f' then
"        vim.api.nvim_command("Files")
"    elseif userInput == 'b' then
"        vim.api.nvim_command("Buffers")
"    end
"end
"
"return function()
"    libmodal.mode.enter('Space', spaceMode) 
"end
"
"EOF
"command! SpaceModeEnter lua require('space_mode')()

"function! s:SpaceMode()
"    if g:spaceModeInput ==# "f"
"        execute 'Files'
"    elseif g:spaceModeInput ==# "b"
"        execute 'Buffers'
"    endif
"endfunction
"
"command! SpaceModeEnter call libmodal#Enter('Space', funcref('s:SpaceMode'))
"
""nnoremap <C-Space> :SpaceModeEnter<cr>
"nnoremap <Space> :SpaceModeEnter<cr>
