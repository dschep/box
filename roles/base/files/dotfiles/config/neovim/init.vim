tnoremap <Esc><Esc> <C-\><C-n> "leave terminal mode
tnoremap <C-W> <C-\><C-n><C-W> " window movement from termmode
autocmd BufEnter term://* startinsert " go back to insert when refocusing terms
nnoremap <C-Space> :CtrlSpace<CR>
source ~/.vimrc
