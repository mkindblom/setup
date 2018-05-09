syntax on
set nocompatible noswapfile
set ruler
set hlsearch incsearch
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set scrolloff=10
set expandtab
set fdm=indent
set foldlevel=0
set number
"set mouse=
"colorscheme hej
set background=dark

if has("gui")
	set transparency=3
	set guifont=Source\ Code\ Pro:h14
endif

" ta av stödhjulen
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" ta av stödhjulen ++
inoremap   <Up>     <NOP>
inoremap   <Down>   <NOP>
inoremap   <Left>   <NOP>
inoremap   <Right>  <NOP>

" insert newline and not enter insertion mode
nnoremap -o o<Esc>

" {{{ Autocompletion using tab

" This function determines whether we are on the start of the line text
" (if so, tab adds indention) or if we want to try to autocomplete.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" }}}

" {{{ Typo-consolation command aliases
command! W w
command! Tabe tabe
command! Wq wq
command! WQ wq
command! Q q
" }}}
