set nocompatible
source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim

" Thu Oct 18 13:30:44 EDT 2012
" let $HOME = '/Users/emallove'

" source ~/vimfiles/plugin/AlignMapsPlugin.vim
" source ~/vimfiles/plugin/AlignPlugin.vim
source ~/vimfiles/autoload/Align.vim
source ~/vimfiles/autoload/AlignMaps.vim
" EAM: 2012.09.22
" source ~/vimfiles/plugin/HTML.vim
source ~/vimfiles/plugin/cecutil.vim
source ~/vimfiles/plugin/eamutils.vim
source ~/vimfiles/plugin/surround.vim
source ~/vimfiles/plugin/ack.vim
source ~/vimfiles/plugin/matchit.vim
" source ~/vimfiles/plugin/fugitive.vim

" behave mswin

" Highlight search terms
set hlsearch

set winheight=99

" Sat Sep 22 11:31:05 EDT 2012
set foldmethod=indent
set shiftwidth=2
set tabstop=2
set expandtab

redir @a

" Mon Sep 24 09:28:44 EDT 2012
set path=.**

" Mon Sep 24 13:31:50 EDT 2012
autocmd BufNewFile,BufRead * set path=.**

" My path keeps getting borked, e.g.,
" path=.,NOTE: Gem.all_load_paths is deprecated with no replacement. It will be removed on or after 2011-10-01.^@Gem.all_load_paths called from -e:1.^@NOTE: Gem.all_partials is deprecated with no replacement. It will be removed on or after 2011-10-01.^@Gem.all_partials called from ~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/site_ruby/1.8/rubygems.rb:261.^@NOTE: Gem.all_partials is deprecated with no replacement. It will be removed on or after 2011-10-01.^@Gem.all_partials called from ~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/site_ruby/1.8/rubygems.rb:261.^@/Users/emallove/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/site_ruby/1.8,~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/site_ruby/1.8/i686-darwin12.0.0,~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/site_ruby,~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/vendor_ruby/1.8,~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/vendor_ruby/1.8/i686-darwin12.0.0,~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/vendor_ruby,~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8,~/.rvm/rubies/ree-1.8.7-2012.02/lib/ruby/1.8/i686-darw

" Wed Sep 26 15:18:50 EDT 2012
set cscopequickfix=s-,c-,d-,i-,t-,e-


" worthwhile?
" Thu Oct  4 11:50:55 EDT 2012
runtime ftplugin/man.vim

" Thu Oct  4 11:50:44 EDT 2012
set number

" Sat Oct 13 11:24:56 PDT 2012
autocmd VimEnter * cscope add cscope.out
autocmd VimEnter * set tags=./TAGS,TAGS

" everything after the ",d" was recorded into the q register
" and pasted using "qp after the ",d" for the map setting!

"
" D is for debugging
if &syntax == "ruby"
  noremap <leader>d i@eam_logger.info __FILE__ + ":" + __LINE__.to_s + " " + __method__.to_s + " pa = "o@eam_logger.info pa.to_yaml
  noremap <leader>p iputs __FILE__ + ":" + __LINE__.to_s + " pa = "oputs pa.to_yaml
elseif &syntax == "cf"
  " noremap <leader>d o<cfdump label=" eam_cfdump pi = " var="##"hPxla output="/tmp/eam-cf.log" format="text" abort="false" metainfo="yes" expand="yes" showUDFs="yes" >0f"l"%pa 
  "
  " Put the current line number in register "l", and print a cold fusion debug
  " message dumping the variable in the @" register
  noremap <leader>d :let @l = line(".") + 1oi<cfdump label=" eam_cfdump "%pa:"lpa ""pa = " var="#pa#" output="/tmp/eam-cf.log" format="text" abort="false" metainfo="yes" expand="yes" showUDFs="yes">
endif

" C is for Comment
if &syntax == "cf"

  " Use XML filetype for MatchIt.vim plugin
  set filetype="xml"

  " Another suggestion from Peppe.  Is this needed?
  " let b:match_words='<:>,<cfif\s\+[^>]*>:<cfelsif\s\+[^>]*>:<cfelse>:</cfif>'

  noremap <leader>c 0I<!--- A --->
elseif &syntax == "html" || &syntax == "xml" || &syntax == "eruby" 
  noremap <leader>c 0I<!-- A -->
elseif &syntax == "ruby"
  noremap <leader>c 0I# 
elseif &syntax == "css"
  noremap <leader>c 0I/* A */
endif

" J is for JavaScript
noremap <leader>j o	console.log();hi""Pa = o	console.log();hP

" git grep <pattern> searches for a pattern in a currently selected git branch.
" This adds :G <pattern> command to run the command from within Vim.
" You can also limit searching to files matching a pattern (git will do the pattern matching):
" :G <pattern> -- '*.c'
"
" http://stackoverflow.com/questions/2415237/techniques-in-git-grep-and-vim
function! GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command! -nargs=? G call GitGrep(<f-args>)

set grepprg=/opt/local/bin/ack-5.12\ $*

" Fri Oct 26 15:38:51 EDT 2012
function! RemoveTerminalControlSequences()

  :%s/ESC\[4;36;1m//
  :%s/ESC\[0m\_s\+ESC\[0m/ /g
  :%s/ESC\[4;35;1m//
  :%s/ESC\[0;1m/ /g
  :%s/ESC\[0m\_s\+/ /g

endfunction

function! MkSessionWithTimestamps(name)

  :let l:datestamp = substitute(system("datestamp"), '\n$', "", "g")
  :let l:cmd = ":mksession! \~/vim-sessions/" . a:name . "." . l:datestamp .  ".vim"
  :let l:cmd .= " | "
  :let l:cmd .= ":wviminfo! \~/vim-sessions/" . a:name . "." . l:datestamp . ".viminfo" 
  :echo "Executing: " . l:cmd
  :execute l:cmd

endfunction

" Needed for MatchIt Plugin to work with different file types, e.g., XML
filetype plugin on

autocmd! BufEnter quickfix :setlocal winheight=99 nowinfixheight

" MacVim seems to default to a dark colorscheme, instead of the preferable
" light one
colorscheme default 
