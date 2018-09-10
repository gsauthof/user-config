runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
" old method:
" call pathogen#infect()
syntax on
filetype plugin indent on

" view man pages inside vim via :Man and \K
runtime ftplugin/man.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Apparently, colorscheme doesn't reliably work when
" placed in the ~/.vimrc - may yield different colors
" than when called interactively:
" colorscheme ron
" colorscheme desert

" relies on another script doing something similar to
" if g:colors_name then colorscheme g:colors_name
" works on Fedora 23
let g:colors_name="ron"
" let g:colors_name="desert"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
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

" cf. https://github.com/chrisbra/Recover.vim/issues/46
let g:RecoverPlugin_Delete_Unmodified_Swapfile=1

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

" cf. https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c', 'cpp']

au FileType text,markdown,tex setlocal tw=65

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
" Last Position Saving
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help last-position-jump
" This autocommand jumps to the last known position in a file
" just after opening it, if the '"' mark is set:
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
               \   exe "normal! g`\"" |
               \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between header/source pairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" simplistic version:
" map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

" requires FSwitch plugin
au! BufEnter *.cc let b:fswitchdst = 'hh,h'
au! BufEnter *.h  let b:fswitchdst = 'cc,c'
map <F4> :FSHere<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  cs reset " in case /etc/vimrc already added some databases
  set csverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set cst "cscopetag

  " keymappings for additional searches (besides the Ctrl+] one)
  "
  " from vim's cscope help page (and slightly modified)
  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

  " Using 'CTRL-spacebar' then a search type makes the vim window
  " split horizontally, with search result displayed in
  " the new window.
  nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

  " Hitting CTRL-space *twice* before the search type does a vertical
  " split instead of a horizontal one
  nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

