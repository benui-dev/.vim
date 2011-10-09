filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
"au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
autocmd BufNewFile,BufRead,BufWrite *.t     setfiletype perl


" Load plugins
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Config Auto Modes
filetype plugin on
autocmd BufNewFile,BufRead,BufWrite *.twiki setfiletype twiki


" Die .tmp files die
set directory=/tmp

let g:CommandTMaxHeight=20

" Write on lose focus
au FocusLost * :wa

" Create new split and move automatically
nnoremap <leader>w <C-w>v<C-w>l

" reselect previously pasted text
nnoremap <leader>v V`]

" Edit vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

function ConfigLook()
  " Use 256 colors
  set t_Co=256

  " Damn I look good
  colorscheme ben
  syntax enable

  "set gfn=Bistream\ Vera\ Sans\ Mono
  set guifont=Bistream\ Vera\ Sans\ Mono:h14

  set guioptions+=LlRrb
  set guioptions-=LlRrb

  set cmdheight=3
  set showmatch " Show matching parents
  set visualbell " Flash, don't beep
  set laststatus=2 " Always display the status bar

  " Ruler at the bottom
  set ruler
  set rulerformat=%40(%t%y:\ %l,%c%V\ \(%o\)\ %p%%%)
  
  " Show line numbers in the gutter.
  set number
  set numberwidth=4

  set history=50 " Use history

  set guioptions-=T " No toolbar

  set wrap
  set textwidth=79
  set formatoptions=qrn1
  set colorcolumn=85

  " TextMate-style showing tabs and newlines
  set list
  set listchars=tab:>\ ,eol:¬
  " set listchars=tab:▸\ 

  set statusline=[%n]\ %{ModifiedFlag()}%f\ %=%h%r%w\ (%v,%l)\ %P\ 
endfunction

function ConfigFeel()
  " Set our tabs correctly... tab inserts 2 spaces.
  set expandtab
  set sts=2
  set shiftwidth=2
  set smartindent
  filetype plugin indent on
  set tabstop=2

  " ; can be used as :  No more shift
  nnoremap ; :

  let mapleader=","

  " fix searching
  nnoremap / /\v
  vnoremap / /\v
  set ignorecase
  set smartcase
  set gdefault
  set incsearch
  set showmatch
  set hlsearch
  " kill highlighting after a search
  nnoremap <leader><space> :noh<cr>


  set whichwrap=<,>,h,l,[,]

  set foldenable

  set incsearch " Incremental search
  set hlsearch
  set ignorecase
  "set smartcase

  " Tab-related stuff.
  " nmap <C-Insert> :tabnew<CR>
  " nmap <C-Delete> :tabclose<CR>
  
  " Change windows with ctrl+shift+direction
  noremap <C-H> <C-w>h
  noremap <C-J> <C-w>j
  noremap <C-K> <C-w>k
  noremap <C-L> <C-w>l

  " Mac-style saving?
  noremap <C-s> :w<CR>

  " Shortcut to rapidly toggle `set list`
  nmap <leader>l :set list!<CR>


  set backspace=indent,eol,start

  " Hidden buffers, so we don't have to save every time we unload a buffer
  " from a window.
  set hidden

  " Display all wildcard matches when :e filena*<tab> -ing.
  set wildmenu

  set undolevels=50
endfunction

function ConfigTags()
  " Recursively look for "tags" files in current directory.
  set tags=tags;/
endfunction

function ConfigAutoComplete()
  " Completion even for one match.
  set completeopt+="menuone"

  " Color
  highlight Pmenu      term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
  highlight PmenuSel   term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
  highlight PmenuSbar  term=NONE cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg=White guibg=Black
  highlight PmenuThumb term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
endfunction

function ConfigCustomMappings()
  nnoremap <leader>f <ESC>:TlistToggle<Return>
  nnoremap <leader>d <ESC>:NERDTreeToggle<Return>
  
  " Changing tabs via minibuf explorer
  nnoremap <C-h> :bp<CR>
  nnoremap <C-l> :bn<CR>
endfunction

function ModifiedFlag()
  if (&modified)
    return "*"
  else
    return " "
  endif
endfunction

function ConfigMiniBufExplorer()
  " minibufexpl.vim configuration
  let g:miniBufExplMapWindowNavVim=0
  let g:miniBufExplSplitBelow=0
  let g:miniBufExplMapWindowNavArrows=0
  let g:miniBufExplMapCTabSwitchBufs=1
  let g:miniBufExplModSelTarget=1
  let g:miniBufExplSplitToEdge=1
endfunction


" Configure everything else
" call ConfigTags()
call ConfigAutoComplete()
call ConfigFeel()
call ConfigLook()
call ConfigMiniBufExplorer()
call ConfigCustomMappings()
