" Extend the errorformat that drives quickfix for Oracle's Pro*C
" embeded SQL pre-processor
"
" Notes:
" - space and backslash must be escaped for set/setlocal
" - comma must be escaped for efm - i.e. \\, with set
" - backslash must be escaped for efm - i.e. \\\\ with set
" - , delimits each scan rule - where ^= and += automatically add them
" - %.%# -> regex .*
" - %[a-z] -> regex [a-z]

" Ignore Version information as the default C efm misinterprets
" it as location information and spams the cl and jumps to a bogus file
" - %-G  -> ignores matching line
setlocal efm^=%-GPro*C/C++:\ Release%.%#

" Parse the Pro*C specific multi-line error messages
" - %E   -> mult-line message start
" - %l   -> line number
"
" Those messages are basically redundant to the 'Error' ones - while
" those are followed by some message
"setlocal efm+=%ESyntax\ error\ at\ line\ %l\\,\ column\ %c\\,\ file\ %f:
"setlocal efm+=%ESemantic\ error\ at\ line\ %l\\,\ column\ %c\\,\ file\ %f:
"
setlocal efm+=%EError\ at\ line\ %l\\,\ column\ %c\ in\ file\ %f
" - %Z   -> multi-line message end
" - %m   -> error message string
setlocal efm+=%ZPCC-%[A-Z]-%[0-9]%#\\,\ %m
setlocal efm+=%ZPLS-S-%[0-9]%#\\,\ %m
" - %C   -> multi-line message continuation
setlocal efm+=%C%.%#
