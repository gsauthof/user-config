" fold docstrings
"
" Regenerate via:
"
"    { echo -e '\n" fold docstrings'; grep 'pythonString.\+pythonTripleQuotes' -A2 /usr/share/vim/vim*/syntax/python.vim | sed 's/keepend$/\0 fold/'; } >> .vim/after/syntax/python.vim
"
syn region  pythonString matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend fold
      \ contains=pythonEscape,pythonUnicodeEscape,pythonSpaceError,pythonDoctest,@Spell
