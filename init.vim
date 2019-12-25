
"   _   ___     _____ __  __ ____   ____
"  | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"  |  \| |\ \ / / | || |\/| | |_) | |
"  | |\  | \ V /  | || |  | |  _ <| |___
"  |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"

let mapleader=" "

" 代码高亮
syntax on

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" 行号
set number
" 特殊的行号
set relativenumber
" 一条线
set cursorline
" 自动换行
let g:python3_host_prog='/usr/bin/python3'
set wrap
"set nowrap
set showcmd
" 补全命令
set wildmenu

set scrolloff=5

" 搜索高亮
set hlsearch
exec "nohlsearch"
" 边输入边高亮
set incsearch
" 忽略大小写
set ignorecase
set smartcase

" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
set foldenable

" Terminal Behaviors
"let g:neoterm_autoscroll = 1
"autocmd TermOpen term://* startinsert
"tnoremap <C-N> <C-\><C-N>
"tnoremap <C-O> <C-\><C-N><C-O>
"let g:terminal_color_0  = '#000000'
"let g:terminal_color_1  = '#FF5555'
"let g:terminal_color_2  = '#50FA7B'
"let g:terminal_color_3  = '#F1FA8C'
"let g:terminal_color_4  = '#BD93F9'
"let g:terminal_color_5  = '#FF79C6'
"let g:terminal_color_6  = '#8BE9FD'
"let g:terminal_color_7  = '#BFBFBF'
"let g:terminal_color_8  = '#4D4D4D'
"let g:terminal_color_9  = '#FF6E67'
"let g:terminal_color_10 = '#5AF78E'
"let g:terminal_color_11 = '#F4F99D'
"let g:terminal_color_12 = '#CAA9FA'
"let g:terminal_color_13 = '#FF92D0'
"let g:terminal_color_14 = '#9AEDFE'

" 取消搜索结果高亮
noremap <LEADER><CR> :nohlsearch<CR>

noremap i k
noremap j h
noremap h i
noremap k j
noremap K 5j
noremap I 5k
noremap H I
noremap Q q

" 跳转文件
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
noremap ]B :blast<CR> 

map s <nop>
map q :q<CR>
map r :w<CR>

" Indentation
nnoremap < <<
nnoremap > >>

" 分频
map sd :set splitright<CR>:vsplit<CR>
map sa :set nosplitright<CR>:vsplit<CR>
map sw :set nosplitbelow<CR>:split<CR>
map ss :set splitbelow<CR>:split<CR>

noremap sv <C-w>b<C-w>K
noremap sc <C-w>b<C-w>H

" 切换分频焦点
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>l <C-w>l
map <LEADER>j <C-w>h

map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

map <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	endif
endfunc

call plug#begin('~/.config/nvim/plugged')

" look 
Plug 'nathanaelkane/vim-indent-guides'

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Other useful utilities
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'`to change 'word' to `word`

"" 快速注释
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line <space>
Plug 'AndrewRadev/switch.vim' " gs 

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" 函数"
Plug 'majutsushi/tagbar'

" 变量高亮
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" latex
Plug 'lervag/vimtex'

" 
Plug 'terryma/vim-multiple-cursors'

" css html
Plug 'mattn/emmet-vim'
 
Plug 'ryanoasis/vim-devicons'
 
call plug#end()

color snazzy

let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" airline


" 全屏显示
map <LEADER>gy :Goyo<CR>


" vim-indent-guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" MarkdownPreview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_brower = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>

" 代码片段
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" 历史记录
map ud :UndotreeToggle<CR><LEADER>j

" 文件树
map ne :NERDTreeToggle<CR>
            \ "Modified"    : "✹",
            \ "Staged"      : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"  : "➜",
            \ "Unmerged"    : "═",
            \ "Deleted"  : "✖",
            \ "Dirty"        : "✗",
            \ "Clean"        : "✔︎",
            \ "Unknown"  : "?"
            \ }


" 查找文件
noremap <C-p> :FZF<CR>
noremap <C-f> :Ag<CR>
noremap <C-h> :History<CR>

" 表格
noremap <LEADER>tm :TableModeToggle<CR>

" 函数
map <silent> T :TagbarOpenAutoClose<CR>

" coc
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" signature
let g:SignatureMap = {
            \ 'Leader':"m",
            \ 'PlaceNextMark':"m,",
            \ 'ToggleMarkAtLine':"m.",
            \ 'PurgeMarksAtLine':"dm",
            \ 'DeleteMark':"",
            \ 'PurgeMarks':"",
            \ 'PurgeMarkers':"",
            \ 'GotoNextLineAlpha':"m<LEADER>",
            \ 'GotoPrevLineAlpha':"",
            \ 'GotoNextSpotAlpha':"m<LEADER>",
            \ 'GotoPrevSpotAlpha':"",
            \ 'GotoNextLineByPos':"",
            \ 'GotoPrevLineByPos':"",
            \ 'GotoNextSpotByPos':"",
            \ 'GotoPrevSpotByPos':"",
            \ 'GotoNextMarker':"",
            \ 'GotoPrevMarker':"",
            \ 'GotoNextMarkerAny':"",
            \ 'GotoPrevMarkerAny':"",
            \ 'ListLocalMarks':"m/",
            \ 'ListLocalMarkers':"m?"
            \ }



" end
exec "nohlsearch"
" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
    exec "e ~/.config/nvim/_machine_specific.vim"
endif
