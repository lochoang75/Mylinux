" ------------------------------------------------------------------------
" set theruntime path to include Vundle and initialize
set hidden
set autochdir
set clipboard^=unnamed " This sets the clipboard as the default register. Useful for copy paste from tmux

set nocompatible " This tells vim not to act like it predecessor vi
syntax enable " enables syntax highlighting
filetype plugin indent on    " identify the kind of filetype automatically

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" for folder manage
Plugin 'scrooloose/nerdtree'
" for snippet
Plugin 'SirVer/ultisnips'
" for auto complete
Plugin 'Valloric/YouCompleteMe'
" for vim airline theme
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'NLKNguyen/papercolor-theme'
" for vim theme
Plugin 'morhetz/gruvbox'
" for html auto generator
Plugin 'mattn/emmet-vim'
" for function manage
Plugin 'majutsushi/tagbar'
" for function find 
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
" for coding time watch
Plugin 'wakatime/vim-wakatime'
" for auto add close tag
Plugin 'jiangmiao/auto-pairs'
" for indent
Plugin 'Yggdroot/indentLine'
" for auto close html tag
Plugin 'alvan/vim-closetag'
" for file auto complete
Plugin 'stegtmeyer/find-complete'

call vundle#end()            " required
"---------------------------------------------------------------------
" prevent vim from giving a warning it the swp file is open 
set shortmess=A
"set foldmethod=syntax
set cursorline
set visualbell
set encoding=utf8
set ignorecase
set nobackup
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set virtualedit=onemore

" -----------------------------------------------------------------------------------------
set laststatus=0
" -----------------------------------------------------------------------------------------
" This sets the color scheme
colorscheme gruvbox
set bg=dark
" -----------------------------------------------------------------------------------------
" wrapping lines when arrows are pressed
set whichwrap+=<,>,h,l,[,]

" -----------------------------------------------------------------------------------------
" set vim for switch between tab 
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

"-----------------------------------------------------------------------------------------
" Set key for toggle nerdtre or tagbar
:nmap <F8> :TagbarToggle<CR>
:nmap <F7> :NERDTreeToggle<CR>

"------------------------------------------------------------------------------------------
"Setting for ACK vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" -----------------------------------------------------------------------------------------
" autocomplete 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 1
set backspace=indent,eol,start

" -----------------------------------------------------------------------------------------
" other editor settings
set number
set mouse=a
set tabstop=4
set shiftwidth=4

" setting indent markers-------------------------------------------------------------------
let g:indentLine_char = '┆'

" -----------------------------------------------------------------------------------------
" Nerd Tree file manager
let g:NERDTreeWinSize=60 
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1 " closes upon opening a file in nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" ------------------------------------------------------------------------------
" UltiSnips stuff 
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsSnippetDirectories = ['/$HOME/config_files/nvim/UltiSnips', 'UltiSnips']
" -------------------------------------------------------------------------------
" set for auto close tag html 
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" -------------------------------------------------------------------------------
"changes cursor color between insert mode and normal mode
if &term =~ "xterm\\|urxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;green\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and urxvt up to version 9.21
endif

au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif
"------------------------------------------------------------------------------
" Air line color scheme
let g:airline_theme='papercolor'
"------------------------------------------------------------------------------
" Set font color scheme
