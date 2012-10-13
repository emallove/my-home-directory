set nocompatible
source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
let $HOME = '/Users/emallove'
source ~/vimfiles/plugin/AlignMapsPlugin.vim
source ~/vimfiles/plugin/AlignPlugin.vim
" EAM: 2012.09.22
" source ~/vimfiles/plugin/HTML.vim
source ~/vimfiles/plugin/cecutil.vim
source ~/vimfiles/plugin/eamutils.vim
source ~/vimfiles/plugin/surround.vim
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
