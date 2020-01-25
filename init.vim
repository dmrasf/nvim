"  __  __  __   __ __     __  ___   __  __   ____     ____
" |  \/  | \ \ / / \ \   / / |_ _| |  \/  | |  _ \   / ___|
" | |\/| |  \ V /   \ \ / /   | |  | |\/| | | |_) | | |
" | |  | |   | |     \ V /    | |  | |  | | |  _ <  | |___
" |_|  |_|   |_|      \_/    |___| |_|  |_| |_| \_\  \____|
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
set wrap
"set nowrap
set showcmd
" 补全命令
set wildmenu
set scrolloff=5
" 搜索高亮
set hlsearch
" 边输入边高亮
set incsearch
" 忽略大小写
set ignorecase
set smartcase

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
"set foldmethod=syntax
"set foldenable

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
nnoremap ]B :blast<CR> 
" 关闭当前 buffer
noremap <C-b> :w<CR>:bd<CR>
" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

map s <nop>
map q :q<CR>
map r :w<CR>
map ; :

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

"  Tab management
" Create a new tab with tu
noremap tn :tabe<CR>
" Move around tabs with tn and ti
noremap ti :-tabnext<CR>
noremap tk :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmi :-tabmove<CR>
noremap tmk :+tabmove<CR>

" 打开终端后进入插入模式
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert

" 保存修改历史
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

map <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		silent! exec "!gcc -o %< % -Wall"
        :sp
        :term ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		silent! exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
        set splitbelow
        :sp
        :term bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run %
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	endif
endfunc

call plug#begin('~/.config/nvim/plugged')

" look 
Plug 'nathanaelkane/vim-indent-guides'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Error checking
Plug 'dense-analysis/ale'

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo Tree
Plug 'mbbill/undotree'

" Git
"Plug 'rhysd/conflict-marker.vim'
" git 管理
Plug 'tpope/vim-fugitive'
" 显示 修改信息
Plug 'airblade/vim-gitgutter'
"
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Track the engine.  现在可以用coc-snipprts
"Plug 'SirVer/ultisnips'
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
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }

" latex文件
Plug 'lervag/vimtex'

" 剪切板 预览
Plug 'junegunn/vim-peekaboo'

" go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" 
Plug 'terryma/vim-multiple-cursors'

" css html
Plug 'mattn/emmet-vim'
 
Plug 'ryanoasis/vim-devicons'

" 中文文档
Plug 'yianwillis/vimcdoc'
 
call plug#end()

color snazzy

let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" airline
let g:airline_theme='base16_shell'
let g:airline#extensions#whitespace#enabled = 0

" 全屏显示
map <LEADER>gy :Goyo<CR>

" 系统剪切板
vnoremap Y "+y

" vim-indent-guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 t 开/关缩进可视化
:nmap <silent> <Leader>t <Plug>IndentGuidesToggle

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
"imap <C-i> <Plug>(coc-snippets-select)
" Use <C-s> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-i>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-i> for both expand and jump (make expand higher priority.)
imap <C-s> <Plug>(coc-snippets-expand-jump)

" 历史记录
map ud :UndotreeToggle<CR><LEADER>j

" 文件树
map ne :NERDTreeToggle<CR>
            \ "Modified"    : "✹",
            \ "Staged"      : "✚",
            \ "Untracked"   : "✭",
            \ "Renamed"     : "➜",
            \ "Unmerged"    : "═",
            \ "Deleted"     : "✖",
            \ "Dirty"       : "✗",
            \ "Clean"       : "✔︎",
            \ "Unknown"     : "?"
            \ }


" 查找文件
noremap <C-f> :FZF<CR>
noremap <C-q> :Ag<CR>
noremap <C-h> :History<CR>

" 表格
noremap <LEADER>tm :TableModeToggle<CR>

" 函数
map <silent> T :TagbarOpenAutoClose<CR>

" coc
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
let g:coc_global_extention = ['coc-python', 'coc-snippets', 'coc-yank', 'coc-pairs', 'coc-lists', 'coc-highlight', 'coc-css', 'coc-html', 'coc-gitignore', 'coc-vimtex']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 给所有变量重命名
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

" ale 禁止错误提示
let g:ale_linters = {
\}
"\   'javascript': ['eslint'],
"\   'python': ['eslint'],
"\   'c': ['eslint'],
"\   'c++': ['eslint'],
"\   'asm': ['eslint'],
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <silent> <C-j> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)

" multi_cursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" end
exec "nohlsearch"
