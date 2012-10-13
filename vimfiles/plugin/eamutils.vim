" EAM: added 6.23.11
redir @a
" set guifont=Courier:h7:cANSI
set expandtab

" EAM: added 6.30.11
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


" Wrap visual selection in an HTML tag.
" vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>
" function! VisualHTMLTagWrap()
"   let tag = input("Tag to wrap block: ")
"   if len(tag) > 0
"     normal `>
"     if &selection == 'exclusive'
"       exe "normal i".tag.""
"     else
"       exe "normal a".tag.""
"     endif
" 
"     normal `<
"     exe "normal i".tag.""
"     normal `<
"   endif
" endfunction

let mapleader = ","

" EAM: added 10.28.11
" Allow for recursive :sfind operations
set path=./**

" EAM: added 11.30.11
set history=200

" EAM: added 12.08.11
set ignorecase

" EAM: added 01.26.12
" FIXME
" set backupdir="C\\:\Users\ethan.mallove\vim-backups"
" set backupdir="C\\:Temp"
" set backupdir=.

" EAM: added 02.09.12
" Ed Pelletier uses 3
" set tabstop=3 shiftwidth=3
set tabstop=2 shiftwidth=2

" EAM: added 02.13.12
set expandtab

" Eclipse uses DOS (not unix), so do so in VIM too
" Don't muck with the file format, otherwise we end
" up with non-edits showing up in the SCM diff (from
" addition/removal of ^M characters)
"
" set fileformat=dos
"

" EAM: 06.01.2012
" Use Powershell!  Instead of old DOS shell
" set shell=cmd.exe
" set shellcmdflag=/c\ powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned

" EAM: Monday, June 11, 2012 11:42:12 AM
" Makeshift autosave
let g:autosave_on_focus_change = 1
autocmd FocusLost * : if &modified && g:autosave_on_focus_change
autocmd FocusLost * :   write
autocmd FocusLost * :   echo "Autosaved file while you were absent"
autocmd FocusLost * : endif



" Insert dateTime
nnoremap <F5> "=strftime("%a, %d %b %Y %H:%M:%S")<CR>PI----- o


"
" FIXME:
" function! SetAutocmdPrependDateTime()
" 
"     " Remove all InsertChange auto commands
"     autocmd! InsertEnter <buffer> * 
" 
"     " Set autocommand
"     autocmd InsertEnter <buffer> * :call PrependDateTimeToCurrentLine()
"   
"     " Set autoindent so that we indent past the timestamp
"     set autoindent
" endfunction
" 
" function! UnSetAutocmdPrependDateTime()
"     " Remove all InsertChange auto commands
"     autocmd! InsertEnter <buffer>
" endfunction
" 
" " Status reports and logging idea
" function! PrependDateTimeToCurrentLine()
" 
"     :s/^/\=strftime("%c")  /
"     normal $A  
"  
" endfunction
" 


" Wrap visual selection in an HTML tag.
vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>
function! VisualHTMLTagWrap()
  let tag = input("Tag to wrap block: ")
  if len(tag) > 0
    normal `>
    if &selection == 'exclusive'
      exe "normal i</".tag.">"
    else
      exe "normal a</".tag.">"
    endif
    normal `<
    exe "normal i<".tag.">"
    normal `<
  endif
endfunction
