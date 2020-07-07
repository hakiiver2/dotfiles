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
set background=dark
set hidden
set nofoldenable

syntax enable

call plug#begin('~/.vim/plugged')

" color
Plug 'arzg/vim-substrata'
Plug 'tomasr/molokai'
Plug 'sainnhe/edge'


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
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc-dart'

" Plug 'ryanolsonx/vim-lsp-typescript'
" Plug 'ryanolsonx/vim-lsp-javascript'

Plug 'zah/nim.vim'

Plug 'vim-jp/vital.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'andys8/vim-elm-syntax'


call plug#end()

let g:lsp_async_completion = 1
let g:lsc_auto_map = v:true
let g:lsc_server_commands = {'dart': 'dart_language_server'}



let g:dart_style_guide = 2




" colorscheme molokai
colorscheme edge


" if executable('dart_language_server')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'dart_language_server',
"         \ 'cmd': {server_info->['dart_language_server', '-mode', 'stdio']},
"         \ 'whitelist': ['dart'],
"         \ })
" endif

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

if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif

" nim
if executable('nimlsp')
   au User lsp_setup call lsp#register_server({
     \ 'name': 'nimlsp',
     \ 'cmd': {server_info->['nimlsp']},
     \ 'whitelist': ['nim'],
     \ })
endif

if executable('elm-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'elm-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'elm-language-server --stdio']},
    \ 'initialization_options': {
      \ 'runtime': 'node',
      \ 'elmPath': 'elm',
      \ 'elmFormatPath': 'elm-format',
      \ 'elmTestPath': 'elm-test',
      \ 'rootPatterns': 'elm.json'
      \ },
    \ 'whitelist': ['elm'],
    \ })
  autocmd BufWritePre *.elm LspDocumentFormat
endif

" if executable('typescript-language-server')
"     au User lsp_setup call lsp#register_server({
"                 \ 'name': 'javascript support using typescript-language-server',
"                 \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"                 \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
"                 \ 'whitelist': ['typescript', 'typescript.tsx', 'javascript', 'javascript.jsx', 'javascriptreact']
"                 \ })
" endif
"
" if executable('typescript-language-server')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'typescript-language-server',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"         \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"         \ 'whitelist': ['typescript', 'typescript.tsx'],
"         \ })
" endif



augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


function! PHPLint()
    let re = system('php -l ' . bufname(""))
    echo re
endfunction

set runtimepath+=~/translating.vim
set runtimepath+=~/minimap.vim
set runtimepath+=~/adjust-space.vim

