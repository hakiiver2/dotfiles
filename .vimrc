set nobackup
set noswapfile
set showcmd
set number
set cursorline
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set expandtab
set wrapscan
set hlsearch
set autoindent
set smartindent
set history=5000
set belloff=all
set viminfo='20,\"1000

syntax enable

call plug#begin('~/.vim/plugged')

" color
Plug 'arzg/vim-substrata'
Plug 'tomasr/molokai'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim' " g>c oneline g> or gc visual  <系 uncomment

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
Plug 'simeji/winresizer'



call plug#end()

let g:lsp_async_completion = 1

colorscheme molokai

" lsp 

" go 
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

" python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END



" function! Preserve(command)
"     " Save the last search.
"     let search = @/
"     " Save the current cursor position.
"     let cursor_position = getpos('.')
"     " Save the current window position.
"     normal! H
"     let window_position = getpos('.')
"     call setpos('.', cursor_position)
"     " Execute the command.
"     execute a:command
"     " Restore the last search.
"     let @/ = search
"     " Restore the previous window position.
"     call setpos('.', window_position)
"     normal! zt
"     " Restore the previous cursor position.
"     call setpos('.', cursor_position)
" endfunction
"
" function! Autopep8()
"     call Preserve(':silent %!autopep8 -')
" endfunction
"
" " Shift + F で自動修正
" autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

