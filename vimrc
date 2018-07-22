""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 				   Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible			" turn on vim extensions

" encodings to utf-8
set encoding=utf-8			" shown encoding
set fileencoding=utf-8			" written to file
set termencoding=utf-8			" encoding for terminal

set mouse=a				" enable mouse

set splitbelow				" split below instead of above
set splitright				" split right instead of left

set smartindent				" smartindent - because


set tabstop=4
set shiftwidth=4
set expandtab
set et

filetype plugin indent on		" load plugin/indent files for filetype

set tags=./tags;/

" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off				" required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim	" add to runtime path
call vundle#begin()			" initialize

Plugin 'VundleVim/Vundle.vim'		" required
Plugin 'SirVer/ultisnips'		" Ultisnips
Plugin 'vim-scripts/OmniCppComplete'	" OmniCppComplete
Plugin 'Valloric/YouCompleteMe'		" YouCompleteMe
Plugin 'vim-scripts/tlib'		" tlib
Plugin 'scrooloose/nerdtree'		" NerdTree
Plugin 'mbbill/undotree'		" UndoTree
Plugin 'vim-scripts/taboo'		" Taboo
Plugin 'vim-scripts/syntastic'		" Syntastic
Plugin 'vim-scripts/united-front'	" United-front
Plugin 'ctrlpvim/ctrlp.vim'		" CTRL-P
Plugin 'artur-shaik/vim-javacomplete2'	" javacomplete2
Plugin 'honza/vim-snippets'		" vim-snippets
Plugin 'lambdalisue/vim-manpager'	" Manpager
Plugin 'tpope/vim-fugitive' 		" Fugitive
Plugin 'majutsushi/tagbar'		" Tagbar
Plugin 'Yggdroot/indentLine'		" indentLine

call vundle#end()			" done

filetype plugin indent on		" filetype on again!




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 				Look and Style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hlsearch				" highlight all text matchings
set number				" show line numbers
set noruler				" no need -> custom status line

syntax enable				" syntax highlighting on

colorscheme desert			" colorscheme


" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2			" alway show status line

set statusline=				" empty statusline

" left side

set statusline +=%t			" file basename
set statusline +=[			" [
set statusline +=%Y			" file type
set statusline +=,			" ,

" file encoding 
if strlen(&fenc)
	set statusline +=%{&fenc} 	" if available: encoding
else
	set statusline +='none'		" else 'none'
endif

set statusline +=,			" ,
set statusline +=%{&ff}			" file format
set statusline +=] 			" ]	

" flags
set statusline +=%H 			" help
set statusline +=%M			" modified
set statusline +=%R			" readonly


" right side

set statusline +=%= 			" align right
set statusline +=%c			" current column
set statusline +=,			" ,
set statusline +=%l			" current line
set statusline +=/			" / 
set statusline +=%L			" total lines in buffer
set statusline +=\ 			" space 
set statusline +=%P			" top/bottom/percentage 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 				Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTRL-SHIFT-T Toggle Taglist
"nnoremap <silent><C-S-t> :TlistToggle<CR> 

" CTRL-SHIFT-T Toggle Tagbar
nnoremap <silent><C-S-T> :TagbarToggle<CR>

" CTRL-SHIFT-U Toggle UndoTree
nnoremap <silent><C-S-u> :UndotreeToggle<CR>

" CTRL-SHIFT-N Toggle NerdTree
nnoremap <silent><C-S-n> :NERDTreeToggle<CR>

" CTRL-SHIFT-P Toggle Ctrl-P Buffer
nnoremap <silent><C-S-p> :CtrlPBuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 				Plugin Configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YouCompleteMe
let g:ycm_confirm_extra_conf=0

" NerdTree
let g:NERDTreeDirArrows=0

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" indentLine 
let g:indentLine_enabled = 1
let g:indentLine_char = '|'

" autolaunch
function! StartUp()
	if argc() == 0
		NERDTree
		Tagbar
		wincmd p
	end
endfunction
autocmd VimEnter * call StartUp()

autocmd FileType java setlocal omnifunc=javacomplete#Complete
