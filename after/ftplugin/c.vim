" OmniCppComplete initialization
call omni#cpp#complete#Init()

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal foldmethod=syntax
setlocal foldnestmax=2

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py' 
let g:ycm_register_as_syntastic_checker=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_key_list_select_completion=['<C-n>']
let g:ycm_key_list_previous_completion=['<C-p>']

autocmd VimEnter * NERDTree
autocmd VimEnter * Tagbar
autocmd VimEnter * wincmd p
