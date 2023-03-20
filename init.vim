" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugin pre-load configuration
"set omnifunc=ale#completion#OmniFunc

" PLUGINS 
" ~/.config/nvim/plugged (UNIX)
" /user/<username>/appdata/local/nvim/plugged (WINDOWS)
call plug#begin(stdpath('config').'/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

lua require('coc')

" natural split settings
set splitbelow
set splitright

filetype plugin on
set encoding=utf-8
syntax on
set nu 
set clipboard=unnamedplus " public copy/paste register
set ruler
set nowrap
set showcmd
set shortmess+=c
set shell=zsh
set hidden

" Indentation and mouse
set tabstop=4 softtabstop=4 noexpandtab shiftwidth=4 smarttab
set backspace=indent,eol,start " let backspace delete over lines
set autoindent
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F1> " enable paste mode
set mouse+=a

" Searching
set wildmenu "graphical auto complete menu

"set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:transparent_background = 'true'

"TreeSitter
:lua << ENDLUA
require'nvim-treesitter.configs'.setup{
	highlight = {
		enable = true,
		additional_vim_regex_highlighting=false,
	}
}
ENDLUA

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

function MyFoldText()
	let line=getline(v:foldstart)
	return " " .. line .. "...  //L:" .. v:foldlevel
endfunction

set foldtext=MyFoldText()
set fillchars=fold:\ 
highlight Folded guibg=None guifg=None guisp=None ctermfg=None ctermbg=None
