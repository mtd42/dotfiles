" **************************************************************************** "
"                                                                              "
"                                                             #                "
"    Filename: .vimrc                                        ###               "
"                                                           #####              "
"    By: mtd42 <https://github.com/mtd42>                  #     #             "
"                                                         ###   ###            "
"    Created: 2018/05/27 20:27:17 by mtd42               ##### #####           "
"    Updated: 2020/10/04 13:39:29 by mtd42        May the force be with you    "
"                                                                              "
" **************************************************************************** "
set nocompatible              " be iMproved, required
filetype off                  " required

" {{{ Autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"
" }}}

" {{{ Tabs 
nnoremap <C-h> :tabprev <CR>
nnoremap <C-l> :tabnext <CR>
nnoremap <C-t> :tabnew 
" }}}

" {{{ Airline configuration
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1 
let g:airline_section_z = '%3p%% %3l/%L  column:%1v'
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1 

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
" }}}

" {{{ Matching characters
highlight ExtraWhitespace ctermbg=255 
match ExtraWhitespace /\s\+$/
" highlight when char > 80
"match ErrorMsg /\%>80v.\+/
" }}}

" {{{ Enable CursorLine
set cursorline
set wildmode=longest,list,full
set wildmenu
" }}}

" {{{ Folding option
set foldmethod=marker  
" }}}

" {{{ Syntax and indentation option
syntax on
set expandtab
set autoindent
set cindent
set shiftwidth=4
set softtabstop=4
set tabstop=8

filetype indent on
set filetype=html
set smartindent
" }}}

" {{{ Exit insert mode
imap :: <Esc>
" }}}

" {{{ Theme setup
" colorscheme vim-monokai-tasty
" colorscheme gruvbox
colorscheme vim-monokai-tasty
" colorscheme hashpunk
set background=dark
hi Normal guibg=NONE ctermbg=NONE
" }}}

" {{{ LineNumber 
set relativenumber
set number
" }}}

" {{{ Replace in buffer src to dest
function Replace(src, dest)
   execute '%s/' . a:src . '/' . a:dest . '/gc'
endfunction
command! -nargs=* Replace call Replace(<f-args>)

:set hlsearch
" }}}

" {{{ Autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType hbs set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" }}}

" {{{ Supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" }}}

" {{{ Beautify
" for javascript
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for java
autocmd FileType java noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for hbs
autocmd FileType hbs noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" for php
autocmd FileType php noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" }}}

" {{{ Html Close tag
":CloseTagToggleBuffer
":CloseTagEnableBuffer
":CloseTagDisableBuffer
" }}}

" {{{ Nerdtree conf
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>e :buffer NERD_tree_1<CR>
map <C-p> :vertical resize +5<CR>
map <C-o> :vertical resize -5<CR>
" }}}

" {{{ Enable mouse
":set mouse=a
" }}}

" {{{ Disable Arrow keys
" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" 
" " Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
" }}}
