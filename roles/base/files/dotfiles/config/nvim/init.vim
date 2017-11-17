" double escape to leave terminal mode (not single escape bc I use VI mode in bash!)
tnoremap <Esc><Esc> <C-\><C-n>
" make Ctrl-W for window movement work from terminal mode
tnoremap <C-W> <C-\><C-n><C-W>
" go back to insert(terminal) mode when focusing a term
autocmd BufEnter term://* startinsert
" source standard vimrc
source ~/.vimrc
" ctrl space not by default? wa? and in terminal mode
nnoremap <C-Space> :CtrlSpace<CR>
tnoremap <C-Space> <C-\><C-n>:CtrlSpace<CR>
