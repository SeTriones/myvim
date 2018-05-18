set nobackup
set ruler
set showcmd
syntax on
set fdm=syntax
set foldlevel=9999
set backspace=indent,eol,start
colo darkblue

set incsearch
set hlsearch

filetype plugin indent on
set number
set smartindent
set nocompatible
set tabstop=4
set softtabstop=4
set cindent shiftwidth=4
set encoding=utf-8
au Filetype python setl et ts=4 sw=4

set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" tagbar relies on Universal Ctags, you can download && make && make install
Plugin 'majutsushi/tagbar'
Plugin 'chase/vim-ansible-yaml'
Plugin 'rdnetto/YCM-Generator'
Plugin 'Yggdroot/LeaderF'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '${path}/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>g :YcmCompleter GoTo<CR>
noremap <F2> :LeaderfFunction!<CR>
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif
let g:Lf_ShortcutF = '<c-p>'
noremap <c-n> :LeaderfMru<cr>

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" go tagbar relies on https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\}

set shell=/bin/bash
set laststatus=2
let g:Powerline_symbols='unicode'
