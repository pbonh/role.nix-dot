let g:startify_list_order = [ 'commands', 'files', 'dir', 'bookmarks', 'sessions' ]
let g:startify_commands = [
        \ {'b': ['Broot File Manager', 'FloatermNew broot']},
        \ {'r': ['Ranger File Manager', 'FloatermNew ranger']},
        \ {'g': ['Lazygit Viewer', 'FloatermNew lazygit']},
        \ {'t': ['Launch Shell', 'Tnew']},
        \ {'pi': ['Install Plugins', 'PlugInstall']},
        \ {'pc': ['Clean Plugins', 'PlugClean']},
        \ {'pu': ['Update Plugins', 'PlugUpdate']},
        \ ]
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0
