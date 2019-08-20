" Disable sound
set visualbell

" Set split
set splitbelow

" Set new buff size
set termwinsize=10x0

" Color scheme
colorscheme gruvbox

" Background
set background=dark

"---------------------------------------------------------------
"---------------------------------------------------------------
" Configure gruvbox
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark = 'soft'

" Configure indent line
"let g:indentLine_color_term = 239
set conceallevel=1
let g:indentLine_conceallevel=1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

" Configure Tagbar
let g:tagbar_width = 30
autocmd VimEnter * nested :call tagbar#autoopen(1)
