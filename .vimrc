" Set up vundle plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Plugin 'kakkyz81/evervim'
" Plugin 'neilagabriel/vim-geeknote'
call vundle#end()
" end vundle setup

" setup evervim
" let g:evervim_devtoken='S=s58:U=61279b:E=15314309f4d:C=14bbc7f72a0:P=1cd:A=en-devtoken:V=2:H=265c62083dc826bb182e3b18fc603a21'

" search for visual selection with '//'
vnoremap // y/<C-R>"<CR>

" code formatting stuff
filetype plugin indent on
set autoindent
set nu
set noexpandtab
set tabstop=2
set shiftwidth=2
syntax on

" python running and code-completion
nmap <F5> :!python %<cr>
let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 15

" split window stuff
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set hlsearch

" netrw file explorer stuff
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
let g:netrw_liststyle=3
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" Change directory to the current buffer when opening files.
set autochdir

" powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

" Convert markdown file to pdf
command! -nargs=* RunSilent
    \ | execute ':silent !'.'<args>'
    \ | execute ':redraw!'
nnoremap <C-O> :RunSilent pandoc --latex-engine=xelatex -o /tmp/vim-pandoc-out.pdf %<CR>

" https://threatpost.com/linux-command-line-editors-high-severity-bug/145569/
set modelines=0
set nomodeline

