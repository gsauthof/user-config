runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" old method
" call pathogen#infect()
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=2
" set ts=2 " tabstop: show tabs as 2 spaces instead of 8 - bad
set expandtab " use spaces, insert tabs in i-mode: CTRL-V TAB

" set list " display ugly tabstops and linebreaks

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set hlsearch
set ignorecase
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<F12>
" show highlight elements
" vim tip #99
map  <F10>  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" cf. http://vi.stackexchange.com/questions/4059/mapping-to-get-last-make-command-and-execute-it-again
nnoremap <F9> :wa<CR>:ma<Up><CR><CR><CR>:cc<CR>
imap <F9> <Esc><F9>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" same effect as -X; helps against extreme startup-delays; see :help -X
set clipboard=exclude:.*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Synatx and Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Comment ctermfg=2           " green
hi String  ctermfg=3           " yellow
hi PreProc ctermfg=9 ctermbg=5 " white on magenta

set matchpairs=(:),{:},[:],<:>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Statusbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler "show cursor position in status bar
set laststatus=2 " always display a status line
set statusline=%-15f\ %8(%3m\ %4r%)\ %3q\ %2n\ %5l:%-3c\ [off:\ %6o]\ (%3p\%%\ of\ %5L\ l)\ %{fugitive#statusline()}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=marker
" open files with all folds opened
" set foldlevelstart=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Haskell
" not possible via ftplugin
" disable highlighting tex in *.lhs, which screws hl otherwise
let g:lhs_markup="none"

" TeX
let g:tex_comment_nospell=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XML Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType xsd setlocal foldmethod=syntax

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au FileType xsd setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commentary Stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" customize the vim-commentary plugin:
autocmd FileType cmake setlocal commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set spell
au FileType tex,markdown,text setlocal spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between header/source pairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" simplistic version:
" map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

" requires FSwitch plugin
au! BufEnter *.cc let b:fswitchdst = 'hh,h'
au! BufEnter *.h  let b:fswitchdst = 'cc,c'
map <F4> :FSHere<CR>

