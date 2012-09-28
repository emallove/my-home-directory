" File Description {{{
" =============================================================================
" File:             powerShellCall.vim
" Version:          1.1
" Description:      Vim script permitting the use of powershell as a 'shell'
" Maintener:        Vincent B <twinside@gmail.com>
" Setup:            Drop the file in your ~/.vim/plugin or vimfiles/plugin
"                   folder
" =============================================================================
" }}}
if exists("g:__POWERSHELLCALL_VIM__")
    finish
endif
let g:__POWERSHELLCALL_VIM__ = 1

" Avoid loading the plugin on anything but windows.
if !has("win32")
    finish
endif

" Boring: long param check {{{
if exists('g:powershellInputTempfilename')
    let s:tempFileNameIn = g:powershellInputTempfilename
else
    let s:tempFileNameIn = 'pshTmpiiii00.ps1'
endif

if exists('g:powershellInputFilter')
    let s:tempFileFilterIn = g:powershellInputFilter
else
    let s:tempFileFilterIn = 'pshTempIn000000.txt'
endif

if exists('g:powershellOutputTempfilename')
    let s:tempFileNameOut = g:powershellOutputTempfilename
else
    let s:tempFileNameOut = 'pshTmp00000.txt'
endif

if exists('g:powershellFileEncoding')
    let s:selectedEncoding = 'g:powershellFileEncoding'
else
    let s:selectedEncoding = 'ascii'
endif

if exists('g:powershellLoadProfile')
    let s:loadProfile = ""
else
    let s:loadProfile = "-noprofile"
endif

let s:systemCall = 'powershell -outputformat text -nologo '
               \ . s:loadProfile . ' "&' . "'./" . s:tempFileNameIn . "'" . '"'
" }}}

" You may wonder, why do we need files to do this operation?
" well :
" - Powershell output Unicode with BOM, which vim doesn't really
"   appreciate.
" - Powershell have hard time accepting input from the standard
"   input...
"
" With this problem in minds, the simplest solution is to create
" a quick and dirty scripts which outputs everything in a file and
" read it after computation.
fun! PowerShellCall(visual, beg, end) range "{{{
    if a:visual
        let beginRange = line("'<")
        let endRange = line("'>")
    else
        let beginRange = a:beg
        let endRange = a:end
    endif

    let script = extend( ['$('], getline( beginRange , endRange ))
    call add( script, ')|out-file -encoding ' . s:selectedEncoding . ' ' . s:tempFileNameOut)
    call writefile( script, s:tempFileNameIn )
    " remove previous lines
    if a:visual
        '<,'>d
    else
        execute beginRange . ',' . endRange . 'd'
    endif

    call system(s:systemCall)
    execute (beginRange - 1) . ',' . (beginRange - 1) . 'r ' . s:tempFileNameOut
    call delete(s:tempFileNameOut)
    call delete(s:tempFileNameIn)
endfunction "}}}

fun! s:PowerShellFilter( visual, beg, end, commandArg ) range "{{{
    if a:visual
        let beginRange = line("'<")
        let endRange = line("'>")
    else
        let beginRange = a:beg
        let endRange = a:end
    endif

    call writefile( getline(beginRange, endRange), s:tempFileFilterIn )

    let script = 'cat ' . s:tempFileFilterIn . ' | % {' . a:commandArg
    call add( script, '}|out-file -encoding ' . s:selectedEncoding . ' ' . s:tempFileNameOut)
    call writefile( script, s:tempFileNameIn )
    " remove previous lines
    if a:visual
        '<,'>d
    else
        execute beginRange . ',' . endRange . 'd'
    endif

    call system(s:systemCall)
    execute (beginRange - 1) . ',' . (beginRange - 1) . 'r ' . s:tempFileNameOut
    call delete(s:tempFileNameOut)
    call delete(s:tempFileNameIn)
    call delete(s:tempFileFilterIn)
endfunction "}}}

nnoremap §§ :.,.Psh
vnoremap §§ :Pshv

command! -range=% Psh call PowerShellCall(0,<line1>,<line2> )
command! -range Pshv call PowerShellCall(1,0,0)
command! -nargs=+ -range PshFilter call s:PowerShellFilter(0,<line1>,<line2>, <args> )

