let g:startify_list_order = [ 'commands', 'files', 'dir', 'bookmarks', 'sessions' ]
let g:startify_commands = [
        \ {'b': ['Broot File Manager', 'FloatermNew br']},
        \ {'r': ['Ranger File Manager', 'Ranger']},
        \ {'c': ['CMake Project(Debug, Makefile)', 'CMake']},
        \ {'t': ['Launch Shell', 'Tnew']},
        \ {'pi': ['Install Plugins', 'PlugInstall']},
        \ {'pc': ['Clean Plugins', 'PlugClean']},
        \ {'pu': ['Update Plugins', 'PlugUpdate']},
        \ ]
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0
