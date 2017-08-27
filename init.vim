call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
call plug#end()

let g:ale_linters = {
\   'javascript': ['standard'],
\}

autocmd bufwritepost *.js silent !standard --fix %
set autoread
