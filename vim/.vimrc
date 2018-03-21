" disable vi compatibility mode
set nocompatible

" PLUGINS
call plug#begin('~/.vim/plugged')

" window zoom in/out
Plug 'vim-scripts/ZoomWin'

" change splash screen
Plug 'mhinz/vim-startify'

" plugin for commenting and uncommenting code
Plug 'scrooloose/nerdcommenter'

" Pretty print of undo tree
Plug 'mbbill/undotree'

" Sensible default configuration
Plug 'tpope/vim-sensible'
" Autodetect indentation
Plug 'tpope/vim-sleuth'

"Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'

Plug 'lifepillar/vim-solarized8'

" current word highlighting
Plug 'ihacklog/HiCursorWords'

"Git related plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Search in files with ag
Plug 'rking/ag.vim'

"Show marked lines
Plug 'kshenoy/vim-signature'

"cscope support
if executable('cscope')
	Plug 'vim-scripts/cscope.vim'
endif

"Word motion for camelcase et al
Plug 'chaoren/vim-wordmotion'

"Sublime like minimap
Plug 'severin-lemaignan/vim-minimap'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do' : './install --all' }
Plug 'junegunn/fzf.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Table Mode
Plug 'dhruvasagar/vim-table-mode'

call plug#end()

" CONFIG

" fzf default keybindings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <silent> <C-P> :Files<CR>


let g:minimap_toggle='<leader>mm'

" Set colours to grayvim or fallback to installed theme
set background=dark
set t_Co=256

colorscheme solarized8_dark

highlight ColorColumn ctermbg=magenta "set to whatever you like
call matchadd('ColorColumn', '\%81v', 100) "set column nr

" filetype and syntax highlighting
filetype plugin indent on
filetype plugin on

syntax on

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highligh = 1
let g:cpp_experimental_template_highlight = 1

" show current number and relative offset for rest
set number
set relativenumber

" highlighing and incremental search while typing
set incsearch
set hlsearch

" search case insensitive if no matches
set ignorecase
set smartcase

" set encoding
set encoding=utf-8

" < and > to round stops values
set shiftround

" ???
set gcr=n:blinkon0

set mouse=a

" Folding specific configuration
set foldmethod=manual

let javaScript_fold=1		" JavaScript
let perl_fold=1			" Perl
let php_folding=1		" PHP
let r_syntax_folding=1		" R
let ruby_fold=1			" Ruby
let sh_fold_enabled=1		" sh
let vimsyn_folding='af'		" Vim script
let xml_syntax_folding=1	" XML

set fillchars="fold: "
hi Folded ctermbg=Black ctermfg=darkyellow

" Startify config
let g:startify_custom_header = []
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [ { 'cv' : '~/.vimrc' }, { 'cz' : '~/.zshrc' }, { 'ca' : '~/.aliases' } ]


" enable persistent undo file
if has("persistent_undo")
	set undodir=~/.undodir_vim/
	set undofile
endif

let mapleader = "\<Space>"

" sudo write
cmap w!! %!sudo tee > /dev/null %

nnoremap <Leader><Space> <c-w><c-p>

"print buffers and prompt for buffer to switch to
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" Search in project
nnoremap <Leader>/ :Ag<Space>
nnoremap <Leader>* :Ag <c-r>=expand("<cword>")<cr><cr>

function! FBufferNext(cnt)
	if a:cnt > 0
		execute "bn " . a:cnt
	else
		execute "bn"
	end
endfunction

function! FBufferPrevious(cnt)
	if a:cnt > 0
		execute "bp " . a:cnt
	else
		execute "bp"
	end
endfunction

nnoremap <Leader>n :<C-U>call FBufferNext(v:count)<CR>
nnoremap <Leader>p :<C-U>call FBufferPrevious(v:count)<CR>

nnoremap <C-k> :<C-U>call FBufferNext(v:count)<CR>
nnoremap <C-j> :<C-U>call FBufferPrevious(v:count)<CR>

set hidden
set wildmenu
set wildmode=list:longest,full

" airline config
let g:airline#extensions#tabline#enabled = 1

set sessionoptions=blank,buffers,curdir,help,tabpages,winsize

";nnoremap <C-L> :<C-U>call FBufferNext(v:count)<CR>
";nnoremap <C-H> :<C-U>call FBufferPrevious(v:count)<CR>

nnoremap <leader>so :so<Space>~/.vimrc<CR>

" Toggle undotree view
nnoremap <Leader>u :UndotreeToggle<CR>

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"use latex for tex files
let g:tex_flavor='latex'

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

"use js syntax for json
autocmd BufNewFile,BufRead *.json set ft=javascript

" vertical split current file and synchronise scrolling
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

set splitbelow
set splitright

" search for current visual selection
vnoremap // y/<C-R>"<CR>

" insert current vim configs as modeline
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Increment variable, can be used in replacements
function! Inc(x)
    let a:x[0] += 1
    return a:x[0]
endfunction

nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

"haskell specific indentation configuration
autocmd Filetype haskell setlocal ts=2 sts=2 sw=2

set laststatus=2
"make vim file encryption more secure (probably won't use it anyway, but hey)
set cryptmethod=blowfish2

" bunch of dumb replacements to save keystrokes
ab iff if and only if
ab if( if (
ab while( while (

" vim: set ts=8 sw=2 tw=78 noet :
