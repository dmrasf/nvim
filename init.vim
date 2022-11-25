"  __  ____   __  _   ___     _____ __  __ ____   ____
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
" Author: dmrasf

" 自动下载插件 {{{
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" nvim设置 {{{
let mapleader=" "
syntax on
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd Filetype * set formatoptions-=o
autocmd BufWinEnter *.xml,*.html,*.htm,*.css,*.js,*.vue,*.json,*.go setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufWinEnter *.launch,*.gazebo,*.xacro,*.dae,*.world setlocal filetype=xml
autocmd BufWinEnter *.rviz setlocal filetype=yaml
autocmd BufWinEnter *.dts,*.dtsi setlocal noexpandtab
set number
set norelativenumber
set signcolumn=auto
set nocursorline
set nocursorcolumn
set colorcolumn=81
set wrap
set showcmd
set wildmenu
set scrolloff=5
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set updatetime=100
set lazyredraw
set ttyfast
set list
set listchars=tab:\│\ ,trail:▫
set fillchars=vert:\│,
set autochdir
set keywordprg=:silent!
set modeline
set noerrorbells
set visualbell
set hidden
set shortmess+=ca
set cmdheight=1
set conceallevel=0
set mouse=a
set foldmethod=indent " 会影响文件打开速度
set foldlevel=99
hi FoldColumn guifg=orange
exec "nohlsearch"
let g:python3_host_prog='/usr/bin/python3'
let g:ruby_host_prog = '$HOME/.gem/ruby/3.0.0/bin/neovim-ruby-host'
" }}}

" 按键映射 {{{
nnoremap i k
nnoremap j h
nnoremap h i
nnoremap k j
vnoremap i k
vnoremap j h
vnoremap h i
vnoremap k j
nnoremap K 3j
nnoremap I 3k
vnoremap K 3j
vnoremap I 3k
nnoremap H I
vnoremap H I
nnoremap Q q
nnoremap Z Q
nnoremap s <nop>
nnoremap q :q<CR>
nnoremap r :w<CR>
nnoremap ; :
nnoremap n nzz
nnoremap N Nzz
nnoremap W 5w
nnoremap B 5b
nnoremap < <<
nnoremap > >>
vnoremap Y "+y
nnoremap fw *
nnoremap fb #

nnoremap <LEADER><CR> :nohlsearch<CR>
inoremap <C-z> <ESC>u
inoremap <C-a> <Esc>A
inoremap <C-h> <Esc>I
nnoremap <ESC> :ccl<CR>
nnoremap <LEADER>v :tabe $HOME/.config/nvim/init.vim<CR>
nnoremap tx :r !figlet
" }}}

" buffer 快捷键 {{{
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
nnoremap <leader>1 :b 1<CR>
nnoremap <leader>2 :b 2<CR>
nnoremap <leader>3 :b 3<CR>
nnoremap <leader>4 :b 4<CR>
nnoremap <leader>5 :b 5<CR>
nnoremap <leader>6 :b 6<CR>
nnoremap <leader>7 :b 7<CR>
nnoremap <leader>8 :b 8<CR>
nnoremap <leader>9 :b 9<CR>
" }}}

" 窗口快捷键 {{{
nnoremap sd :set splitright<CR>:vsplit<CR>
nnoremap sa :set nosplitright<CR>:vsplit<CR>
nnoremap sw :set nosplitbelow<CR>:split<CR>
nnoremap ss :set splitbelow<CR>:split<CR>
nnoremap <LEADER>i <C-w>k
nnoremap <LEADER>k <C-w>j
nnoremap <LEADER>l <C-w>l
nnoremap <LEADER>j <C-w>h
nnoremap sv <C-w>b<C-w>K
nnoremap sc <C-w>b<C-w>H
nnoremap <M-u> <C-w>p<C-u><C-w>p
nnoremap <M-d> <C-w>p<C-d><C-w>p
nnoremap <up> :res -1<CR>
nnoremap <down> :res +1<CR>
nnoremap <left> :vertical resize+1<CR>
nnoremap <right> :vertical resize-1<CR>
" }}}

" Tab management {{{
nnoremap tn :tabe<CR>
nnoremap ti :-tabnext<CR>
nnoremap tk :+tabnext<CR>
nnoremap tmi :-tabmove<CR>
nnoremap tmk :+tabmove<CR>
" }}}

" 内置终端设置 {{{
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
autocmd TermOpen * setlocal norelativenumber nonumber signcolumn=no
nnoremap <a-t> :set splitbelow<CR>:split<CR> :terminal<CR>
nnoremap <a-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
nnoremap <a-r> :tabe<CR>:-tabmove<CR>:term ranger<CR>
tnoremap <C-N> <C-\><C-N>
" }}}

" markdown 快捷键 {{{
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown nnoremap ,c ebi`<ESC>ea`<ESC>b
autocmd Filetype markdown nnoremap ,b 0i**<ESC>A**<ESC>j0
autocmd Filetype markdown inoremap ,e $$<ESC>i
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
" }}}

" 保存修改历史和光标位置 {{{
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.config/nvim/tmp/undo,.
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" quickfix 设置 {{{
augroup VimInitStyle
    au!
    au FileType qf setlocal norelativenumber
augroup END
" }}}

" 执行程序 {{{
nnoremap <LEADER>r :call Run()<CR>
func! Run()
    exec "w"
    if &filetype == 'c'
        set splitbelow
        silent! exec "!gcc -g -o %< % -Wall -lm"
        :sp
        :term ./%<
    elseif &filetype == 'cpp'
        set splitbelow
        silent! exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :term ./%<
    elseif &filetype == "cs"
        set splitbelow
        silent! exec "!mcs *.cs"
        :sp
        let l:cs = "term mono " . "*.exe"
        exec l:cs
    elseif &filetype == 'java'
        silent! exec "!javac %"
        set splitbelow
        :sp
        :term java %<
    elseif &filetype == 'sh'
        set splitbelow
        :sp
        :term bash %
    elseif &filetype == 'pl'
        set splitbelow
        :sp
        :term perl %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python3 %
    elseif &filetype == 'perl'
        set splitbelow
        :sp
        :term perl %
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term node %
    elseif &filetype == 'html'
        silent! exec "!google-chrome-stable % &"
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'vim'
        :so %
    elseif &filetype == 'rust'
        set splitbelow
        :sp
        :term proxychains -q cargo run
    endif
endfunc
" }}}

" 大文件设置 {{{
let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END
function LargeFile()
    syntax off
    exec "CocDisable"
    setlocal bufhidden=unload
    setlocal undolevels=-1
    autocmd VimEnter * echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see init.vim for details)."
endfunction
" }}}

" 输入法自动切换 {{{
let g:input_toggle = 2
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 1
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -o")
    endif
endfunction
function! Fcitx2zh()
    if g:input_toggle == 1
        let l:a = system("fcitx-remote -c")
        let g:input_toggle = 2
    endif
endfunction
autocmd InsertEnter * call Fcitx2zh()
autocmd InsertLeave * call Fcitx2en()
" }}}

" 插件目录 {{{
call plug#begin('$HOME/.config/nvim/plugged')

" dress
Plug 'nvim-lualine/lualine.nvim'       " lua statusline
Plug 'kyazdani42/nvim-web-devicons'    " devicons
Plug 'connorholyday/vim-snazzy'        " colorstheme
Plug 'ajmwagar/vim-deus'               " colorstheme
Plug 'sainnhe/gruvbox-material'        " colorstheme
Plug 'sainnhe/forest-night'            " colorstheme
Plug 'sonph/onehalf', { 'rtp': 'vim' } " colorstheme
Plug 'jpo/vim-railscasts-theme'        " colorstheme
Plug 'ayu-theme/ayu-vim'               " colorstheme
Plug 'luochen1990/rainbow'             " rainbow 括号
Plug 'junegunn/goyo.vim'               " distraction free writing mode
Plug 'ryanoasis/vim-devicons'          " nerdfont devicons
Plug 'Chiel92/vim-autoformat'          " autoformat \f
Plug 'godlygeek/tabular'               " 对齐文本
Plug 'romainl/vim-cool'                " 自动取消高亮
Plug 'itchyny/vim-cursorword'          " 下划线
Plug 'Yggdroot/indentLine'             " indentLine

" highlight and complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}                             " coc
Plug 'honza/vim-snippets'                                                   " 代码片段集合
Plug 'mattn/emmet-vim'                                                      " <M-m>,  html
Plug 'dart-lang/dart-vim-plugin'                                            " dart lsp
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python'] } " 高亮python
Plug 'lervag/vimtex'                                                        " 写latex

" 查找文件
Plug 'junegunn/fzf.vim'      " fzf
Plug 'ctrlpvim/ctrlp.vim'    " cmd CtrlP

" git
Plug 'tpope/vim-fugitive'      " git 命令
Plug 'airblade/vim-gitgutter'  " show git
Plug 'rhysd/git-messenger.vim' " git message
Plug 'APZelos/blamer.nvim'     " 显示提交信息

" Markdown
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mzlogin/vim-markdown-toc'

" some tool
Plug 'mbbill/undotree'                                    " 修改历史
Plug 'liuchengxu/vista.vim'                               " 大纲
Plug 'tpope/vim-surround'                                 " type cs'[to change 'word' to [word]
Plug 'tpope/vim-capslock'                                 " <C-l> 插入模式下暂时切换capslock
Plug 'tpope/vim-speeddating'                              " <c-a> <c-x> 数字增加
Plug 'tpope/vim-repeat'                                   " . 支持其它插件操作
Plug 'AndrewRadev/switch.vim'                             " gs 修改true false
Plug 'scrooloose/nerdcommenter'                           " in <space>cc to comment a line <space>
Plug 'itchyny/calendar.vim'                               " 日历
Plug 'mg979/vim-visual-multi', {'branch': 'master'}       " 多选编辑
Plug 'dkarter/bullets.vim'                                " <C-t> <C-d>
Plug 'MattesGroeger/vim-bookmarks'                        " 书签
Plug 'junegunn/vim-peekaboo'                              " 在插入模式下使用寄存器 <C-r>
Plug 'AndrewRadev/splitjoin.vim'                          " gS  gJ 单行 多行
Plug 'skywind3000/asynctasks.vim'                         " 自动任务
Plug 'skywind3000/asyncrun.vim'                           " 自动任务
Plug 'yuttie/comfortable-motion.vim'                      " 更顺滑的scroll
Plug 'gcmt/wildfire.vim'                                  " <ENTER>  <BS>
Plug 'matze/vim-move'                                     " 整行 整块移动
Plug 'wakatime/vim-wakatime'                              " 编辑时间
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " 颜色高亮
Plug 'dstein64/vim-startuptime'                           " 显示启动时间
Plug 'airblade/vim-rooter'                                " 自动切换项目根目录

call plug#end()
" }}}

" 美化相关插件 {{{
" =================================
" =========== lualine =============
" =================================
source $HOME/.config/nvim/lualine_config.lua


" =====================================
" =========== colorscheme =============
" =====================================
if has('termguicolors')
    set termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_transparent_background = 0
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_italic_comment = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_menu_selection_background = 'orange'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_spell_foreground = 'colored'
let g:gruvbox_material_ui_contrast = 'high'
let g:gruvbox_material_diagnostic_text_highlight = 0
let g:gruvbox_material_diagnostic_line_highlight = 0
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
colorscheme gruvbox-material


" =================================
" =========== rainbow =============
" =================================
let g:rainbow_active = 1


" ========================
" ======== goyo ==========
" ========================
map <LEADER>gy :Goyo<CR>


" ====================================
" =========== autoformat =============
" ====================================
noremap <a-f> :Autoformat<CR>
autocmd BufWrite *.js :Autoformat


" ====================================
" =========== indentLine =============
" ====================================
let g:indentLine_char = '│'
autocmd BufWinEnter *.md,*.json IndentLinesDisable
let g:indentLine_bufTypeExclude = ['help', 'terminal']
" }}}

" 高亮补全插件 {{{
" ===========================
" ========== coc ============
" ===========================
let g:coc_global_extention = [
            \ 'coc-calc',
            \ 'coc-ci',
            \ 'coc-css',
            \ 'coc-clangd',
            \ 'coc-cmake',
            \ 'coc-explorer',
            \ 'coc-flutter',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-lua',
            \ 'coc-pairs',
            \ 'coc-python',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-yaml',
            \ 'coc-yank',
            \]
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use M to show documentation in preview window.
nnoremap <silent> M :call ShowDocumentation()<CR>
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
nmap <silent> <C-j> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-k> <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nnoremap <C-c> :CocCommand<CR>
nnoremap <C-l> :CocList<CR>
" coc-explorer
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap tr <Plug>(coc-translator-p)
" coc-snippets
let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-i>'
imap <C-o> <Plug>(coc-snippets-expand)
" coc-calc
nmap <Leader>ca <Plug>(coc-calc-result-append)
nmap <Leader>cr <Plug>(coc-calc-result-replace)
" coc-ci
nmap <silent>w <Plug>(coc-ci-w)
nmap <silent>b <Plug>(coc-ci-b)
" coc-action
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)


" ===========================
" ========== emmet ==========
" ===========================
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,markdown EmmetInstall
let g:user_emmet_leader_key='<M-m>'


" =========================================
" =========== dart-vim-plugin =============
" =========================================
let g:dart_style_guide = 2
let g:dart_format_on_save = 1


" ================================
" =========== vimtex =============
" ================================
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_log_ignore = ['Warning']
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let g:vimtex_quickfix_enabled = 0
let maplocalleader = ' '
let g:vimtex_compiler_progname = 'nvr'
" }}}

" 查找工具插件 {{{
" ===========================
" ========= fzf =============
" ===========================
noremap \f :FZF<CR>
noremap <a-q> :Ag 
noremap <a-h> :History<CR>
noremap <a-b> :Buffers<CR>
let g:fzf_preview_window = 'right:30%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===============================
" =========== ctrlp =============
" ===============================
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
" }}}

" git相关插件 {{{
" ==================================
" =========== fugitive =============
" ==================================
noremap \g :Git


" ===================================
" =========== gitgutter =============
" ===================================
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap [g :GitGutterPrevHunk<CR>
nnoremap ]g :GitGutterNextHunk<CR>
"let g:gitgutter_sign_added            = '🟩'
"let g:gitgutter_sign_removed          = '🟥'
"let g:gitgutter_sign_modified         = '🟨'
"let g:gitgutter_sign_modified_removed = '🟧'


" =====================================
" =========== git-message =============
" =====================================
let g:git_messenger_no_default_mappings = v:true
nmap gm <Plug>(git-messenger)


" ================================
" =========== blamer =============
" ================================
let g:blamer_enabled = 0
let g:blamer_delay = 300
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' '
let g:blamer_template = '<committer>: <summary> • <committer-time>'
let g:blamer_date_format = '%y/%m/%d %H:%M'
let g:blamer_relative_time = 0
highlight Blamer guifg=grey
" }}}

" markdown插件 {{{
" ==================================
" ======== vim-table-mode ==========
" ==================================
noremap <LEADER>tm :TableModeToggle<CR>


" ==========================================
" =========== vim-markdown-toc =============
" ==========================================
let g:vmt_dont_insert_fence = 1
" }}}

" 常用工具插件 {{{
" ===========================
" ======== undotree =========
" ===========================
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
    nmap <buffer> i <plug>UndotreeNextState
    nmap <buffer> k <plug>UndotreePreviousState
    nmap <buffer> I 5<plug>UndotreeNextState
    nmap <buffer> K 5<plug>UndotreePreviousState
endfunc


" ============================
" ========== vista ===========
" ============================
map <silent> T :Vista!!<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }


" =======================================
" =========== nerdcommenter =============
" =======================================
" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_java = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {}


" ======================================
" =========== vim-calendar =============
" ======================================
"noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
augroup calendar-mappings
    autocmd!
    autocmd FileType calendar IndentLinesDisable
    " diamond cursor
    autocmd FileType calendar nmap <buffer> i <Plug>(calendar_up)
    autocmd FileType calendar nmap <buffer> j <Plug>(calendar_left)
    autocmd FileType calendar nmap <buffer> k <Plug>(calendar_down)
    autocmd FileType calendar nmap <buffer> l <Plug>(calendar_right)
    autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_up)
    autocmd FileType calendar nmap <buffer> <c-j> <Plug>(calendar_move_left)
    autocmd FileType calendar nmap <buffer> <c-k> <Plug>(calendar_move_down)
    autocmd FileType calendar nmap <buffer> <c-l> <Plug>(calendar_move_right)
    autocmd FileType calendar nmap <buffer> h <Plug>(calendar_start_insert)
    autocmd FileType calendar nmap <buffer> H <Plug>(calendar_start_insert_head)
    "autocmd FileType calendar nunmap <buffer> <C-n>
    "autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ==========================================
" =========== vim-visual-multi =============
" ==========================================
let g:VM_maps = {}
let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps['Select All']  = '<M-n>'
let g:VM_maps['Visual All']  = '<M-n>'
let g:VM_maps['Skip Region'] = '<C-x>'
let g:VM_maps['Remove Region'] = '<C-p>'
let g:VM_maps['Increase']    = '+'
let g:VM_maps['Decrease']    = '-'
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_custom_motions  = {'j': 'h', 'l': 'l', 'i': 'k', 'k': 'j'}
let g:VM_maps['i'] = 'h'
let g:VM_maps['I'] = 'H'


" ==================================
" =========== bullets  =============
" ==================================
let g:bullets_enabled_file_types = ['text',  'gitcommit',  'scratch']


" =======================================
" =========== vim-bookmarks =============
" =======================================
let g:bookmark_sign = ''
let g:bookmark_annotation_sign = ''
let g:bookmark_auto_save_file = $HOME . '/.local/share/nvim/.vim-bookmarks'


" ===================================
" =========== splitjoin =============
" ===================================
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap si :SplitjoinJoin<cr>
nmap sk :SplitjoinSplit<cr>


" ====================================
" =========== asynctasks =============
" ====================================
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['build', '.git', '.svn', '.root', '.project', '.hg']


" ============================================
" =========== comfortable_motion =============
" ============================================
let g:comfortable_motion_friction = 100
let g:comfortable_motion_air_drag = 2
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
"noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
"noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>


" ==================================
" =========== wildfire =============
" ==================================
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>"]


" ==================================
" =========== vim-move =============
" ==================================
let g:move_map_keys = 0
vmap <A-k> <Plug>MoveBlockDown
vmap <A-i> <Plug>MoveBlockUp
vmap <A-j> <Plug>MoveBlockLeft
vmap <A-l> <Plug>MoveBlockRight
nmap <A-k> <Plug>MoveLineDown
nmap <A-i> <Plug>MoveLineUp
nmap <A-j> <Plug>MoveLineLeft
nmap <A-l> <Plug>MoveLineRight


" ========================================
" =========== vim-hexokinase =============
" ========================================
let g:Hexokinase_highlighters = [ 'virtual' ]

" ====================================
" =========== vim-rooter =============
" ====================================
let g:rooter_patterns = ['.git', '*.sln']
" }}}

