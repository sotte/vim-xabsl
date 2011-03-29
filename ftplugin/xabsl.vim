" some sane xabsl settings

setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent
setlocal smarttab

autocmd BufWritePre *.xabsl :%s/\s\+$//e
