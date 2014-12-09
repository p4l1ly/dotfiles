" Handy function to search previous lines for indent levels and
" use those instead of multiples of shiftwidth.
function! DedentToPrevious()
python << EOF
import vim

tabsize = int(vim.eval("&ts"))
l       = vim.current.line
rest    = l.lstrip()
indent  = l[:-len(rest)]
if indent != "":
    cur_size = len(indent.replace("\t", " "*tabsize))
    idx      = vim.current.window.cursor[0]-2
    while idx >= 0:
      ll = vim.current.buffer[idx]
      indent = ll[:-len(ll.lstrip())]
      if len(indent.replace("\t", " "*tabsize)) < cur_size:
        vim.current.line = indent+rest
        break
      idx -= 1
EOF
endfunction

" replace the <C-D> in insert mode with the above function
imap <C-d> <C-o>:call DedentToPrevious()<CR>
