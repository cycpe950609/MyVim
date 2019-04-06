nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 -g "$(VIM_FILEPATH)" -o "$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F6> :Ltarget   $(VIM_FILENOEXT) <cr>
