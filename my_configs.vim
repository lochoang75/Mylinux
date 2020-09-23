" Disable sound
set visualbell

" Set split
set splitbelow

" Set new buff size
set termwinsize=10x0

" Set color term for terminal use
let g:solarized_termcolors= 256
" set this to disable transparent layer in the upper of text 
let g:solarized_termtrans = 1

" Color scheme
colorscheme solarized
" Background
set background=dark

"---------------------------------------------------------------
"---------------------------------------------------------------
" Configure gruvbox
"let g:gruvbox_termcolors=16
"let g:gruvbox_contrast_dark = 'soft'

" Configure indent line
"let g:indentLine_color_term = 239
set conceallevel=1
let g:indentLine_conceallevel=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

" Config for pep 8 python
au BufNewFile,BufRead *.py
            \ set tabstop=4     |
            \ set softtabstop=4 |
            \ set shiftwidth=4  |
            \ set textwidth=79  |
            \ set expandtab     |
            \ set autoindent    |   
            \ set fileformat=unix

" Config auto config
let g:ycm_autoclose_preview_window_after_completion=1

" Disable auto replace mode in vim
if $TERM =~ 'xterm-256color'
    set noek
endif
