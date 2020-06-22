"  __  ____   __  _   ___     _____ __  __ ____   ____
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
set rtp+=~/Desktop/vim-recite

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=" "

syntax on
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set scrolloff=5
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set colorcolumn=80
set updatetime=1000
set vb t_vb=
set ttyfast
set list
set listchars=tab:\|\ ,trail:▫
set fillchars=vert:\║

" zf 创建  zc 折叠  zo 打开  [z  ]z   zj  zk 在折叠间移动
set foldmethod=indent
set foldlevel=99
set foldenable
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

noremap <LEADER><CR> :nohlsearch<CR>
noremap <ESC> :ccl<CR>

noremap i k
noremap j h
noremap h i
noremap k j
noremap K 5j
noremap I 5k
noremap H I
noremap Q q
noremap Z Q
noremap n nzz
noremap N Nzz
noremap W 5w
noremap B 5b

" 跳转文件
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
noremap <C-b> :bd
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

nnoremap < <<
nnoremap > >>

vnoremap Y "+y

map sd :set splitright<CR>:vsplit<CR>
map sa :set nosplitright<CR>:vsplit<CR>
map sw :set nosplitbelow<CR>:split<CR>
map ss :set splitbelow<CR>:split<CR>
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
noremap sv <C-w>b<C-w>K
noremap sc <C-w>b<C-w>H

inoremap <C-o> <Esc>o
inoremap <C-a> <Esc>A
inoremap <C-h> <Esc>I

"noremap <esc> :ccl<CR>
noremap tx :r !figlet

map <up> :res -1<CR>
map <down> :res +1<CR>
map <left> :vertical resize+1<CR>
map <right> :vertical resize-1<CR>

" Tab management
noremap tn :tabe<CR>
noremap ti :-tabnext<CR>
noremap tk :+tabnext<CR>
noremap tmi :-tabmove<CR>
noremap tmk :+tabmove<CR>

" 打开终端后进入插入模式
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#282828'     "black
let g:terminal_color_1  = '#cc241d'     "red
let g:terminal_color_2  = '#98971a'     "green
let g:terminal_color_3  = '#d79921'     "yellow
let g:terminal_color_4  = '#458588'     "blue
let g:terminal_color_5  = '#b16286'     "magenta
let g:terminal_color_6  = '#689d6a'     "cyan
let g:terminal_color_7  = '#a89984'     "white
let g:terminal_color_8  = '#928374'     "black
let g:terminal_color_9  = '#fb4934'     "red
let g:terminal_color_10 = '#b8bb26'     "green
let g:terminal_color_11 = '#fabd2f'     "yellow
let g:terminal_color_12 = '#83a598'     "blue
let g:terminal_color_13 = '#d3869b'     "magenta
let g:terminal_color_14 = '#8ec07c'     "cyan
let g:terminal_color_15 = '#ebdbb2'     "white

noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

let g:python_host_prog='/usr/bin/python'
let g:python2_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'


" ===========================
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
" ===========================
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
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

" 保存修改历史
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap <LEADER>v :tabe ~/.config/nvim/init.vim<CR>
inoremap <C-z> <ESC>u

map <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
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
        silent! exec "!firefox-developer-edition % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'vim'
        :so %
    endif
endfunc

call plug#begin('~/.config/nvim/plugged')

" look
Plug 'mg979/vim-xtabline'
"Plug 'liuchengxu/eleline.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'hardcoreplayers/spaceline.vim'
Plug 'wincent/terminus'
Plug 'luochen1990/rainbow'
Plug 'connorholyday/vim-snazzy'
Plug 'ajmwagar/vim-deus'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'ryanoasis/vim-devicons'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'Konfekt/FastFold'
Plug 'Chiel92/vim-autoformat'

"for coc-clangd
Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'     "<C-y>,
Plug 'dense-analysis/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'mbbill/undotree'
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" 查找文件
Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'brooth/far.vim'                   " :Far
Plug 'rhysd/clever-f.vim'               "fsfff
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pechorin/any-jump.vim'  " <M-j>
Plug 'easymotion/vim-easymotion'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

Plug 'yianwillis/vimcdoc'    " 中文文档
Plug 'junegunn/goyo.vim'     " distraction free writing mode
Plug 'tpope/vim-surround'    " type cs'`to change 'word' to `word`
Plug 'tpope/vim-capslock'    " <C-l> capslock
Plug 'tpope/vim-speeddating' " <c-a> <c-x>
Plug 'tpope/vim-repeat'
Plug 'AndrewRadev/switch.vim' " gs
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line <space>
Plug 'itchyny/calendar.vim'
Plug 'liuchengxu/vista.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-startify'
Plug 'dkarter/bullets.vim'              "<C-t> <C-d>
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vimwiki/vimwiki'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'junegunn/vim-peekaboo'
Plug 'romainl/vim-cool'              " 自动取消高亮
Plug 'itchyny/vim-cursorword'        " 下划线
Plug 'AndrewRadev/splitjoin.vim'     " gS  gJ 单行 多行
Plug 'KabbAmine/vCoolor.vim'         " 颜色选择
Plug 'godlygeek/tabular'             " 对齐文本
Plug 'skywind3000/vim-terminal-help' " 快速打开terminal
Plug 'chrisbra/NrrwRgn'              " 产生非干扰区
"Plug 'dmrasf/vim-recite'

call plug#end()


" enable true colors support
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
color gruvbox
"let g:seoul256_background = 233
"colo seoul256


" ==================================
" =========== xtabline =============
" ==================================
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.show_right_corner = 0
let g:xtabline_settings.last_open_first = 1
noremap ts :XTabCycleMode<CR>
noremap \p :XTabInfo<CR>


" ===========================
" ======== airline ==========
" ===========================
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#whitespace#enabled = 0


" ===========================================
" =========== vim-indent-guides =============
" ===========================================
"let g:indent_guides_default_mapping = 0
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"nmap <silent> <Leader>t <Plug>IndentGuidesToggle


" ==================================
" =========== FastFold =============
" ==================================
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']


" ====================================
" =========== autoformat =============
" ====================================
noremap \f :Autoformat<CR>


" ======================================
" =========== vim-calendar =============
" ======================================
"noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1
augroup calendar-mappings
    autocmd!
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


" ================================
" =========== vim-go =============
" ================================
let g:go_echo_go_info = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_list_type = "quickfix"
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap gr <Plug>(go-referrers)
au FileType go nmap M <Plug>(go-doc)


" ====================================
" =========== vimspector =============
" ====================================
"let g:vimspector_enable_mappings = 'HUMAN'
"function! s:read_template_into_buffer(template)
"" has to be a function to avoid the extra space fzf#run insers otherwise
"execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
"endfunction
"command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            "\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
            "\   'down': 20,
            "\   'sink': function('<sid>read_template_into_buffer')
            "\ })
"noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
"sign define vimspectorBP text=☛ texthl=Normal
"sign define vimspectorBPDisabled text=☞ texthl=Normal
"sign define vimspectorPC text=🔶 texthl=SpellBad


" ============================
" ======== 全屏显示 ==========
" ============================
map <LEADER>gy :Goyo<CR>


" =======================
" ======== far ==========
" =======================
set lazyredraw
set regexpengine=1
noremap <LEADER>f :F


" ==================================
" =========== any-jump =============
" ==================================
let g:any_jump_disable_default_keybindings = 1
nnoremap <M-j> :AnyJump<CR>


" ===================================
" ======== MarkdownPreview ==========
" ===================================
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = ''
let g:mkdp_brower = 'chromium'
let g:mkdp_echo_preview_url = 1
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


" ===========================
" ======== vimwiki ==========
" ===========================
let g:vimwiki_list = [{'path': '~/Documents/Notes/',
            \ 'syntax': 'markdown', 'ext': '.md'}]


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


" =======================================
" =========== vim-bookmarks =============
" =======================================
let g:bookmark_sign = ''
let g:bookmark_annotation_sign = ''
let g:bookmark_auto_save_file = $HOME . '/.local/share/nvim/.vim-bookmarks'


" ================================
" =========== rnvimr =============
" ================================
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
nnoremap <silent> R :RnvimrSync<CR>:RnvimrToggle<CR>


" ===========================
" ========= fzf =============
" ===========================
set rtp+=/usr/local/opt/fzf
noremap <C-f> :FZF<CR>
noremap <C-q> :Ag<CR>
noremap <C-h> :History<CR>
noremap <C-y> :Buffers<CR>


" ==================================
" ======== vim-table-mode ==========
" ==================================
noremap <LEADER>tm :TableModeToggle<CR>


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


" ==================================
" =========== clever-f =============
" ==================================
let g:clever_f_not_overwrites_standard_mappings = 1
nmap f <Plug>(clever-f-f)
xmap f <Plug>(clever-f-f)
omap f <Plug>(clever-f-f)
nmap F <Plug>(clever-f-F)
xmap F <Plug>(clever-f-F)
omap F <Plug>(clever-f-F)


" ====================================
" =========== easymotion =============
" ====================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
map '' <Plug>(easymotion-bd-c)
nmap '' <Plug>(easymotion-bd-c)


" ===========================
" ========== coc ============
" ===========================
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
let g:coc_global_extention = ['coc-go', 'coc-svg', 'coc-marketplace', 'coc-clangd', 'coc-spell-checker', 'coc-ci', 'coc-vimlsp', 'coc-calc', 'coc-java', 'coc-tsserver', 'coc-translator', 'coc-json', 'coc-explorer', 'coc-python', 'coc-snippets', 'coc-yank', 'coc-pairs', 'coc-lists', 'coc-highlight', 'coc-css', 'coc-html', 'coc-gitignore', 'coc-todolist', 'coc-actions']
autocmd FileType python nmap <silent> gd <Plug>(coc-definition)
autocmd FileType python nmap <silent> gy <Plug>(coc-type-definition)
autocmd FileType python nmap <silent> gi <Plug>(coc-implementation)
autocmd FileType python nmap <silent> gr <Plug>(coc-references)
nnoremap <C-c> :CocCommand<CR>
nnoremap <C-l> :CocList<CR>
" coc-python
nmap <leader>rn <Plug>(coc-rename)
" coc-explorer
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap tr <Plug>(coc-translator-p)
" coc-snippets
let g:coc_snippet_next = '<C-k>'
let g:coc_snippet_prev = '<C-i>'
imap <C-k> <Plug>(coc-snippets-expand-jump)
" coc-actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-calc
nmap <Leader>ca <Plug>(coc-calc-result-append)
nmap <Leader>cr <Plug>(coc-calc-result-replace)
" coc-ci
nmap <silent> w <Plug>(coc-ci-w)
nmap <silent> b <Plug>(coc-ci-b)


" ===========================
" ========== ale ============
" ===========================
let g:ale_linters = { 'go': ['eslint'], }
"   'javascript': ['eslint'],
"   'python': ['eslint'],
"   'c': ['eslint'],
"   'c++': ['eslint'],
"   'asm': ['eslint'],
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
nmap <silent> <C-j> <Plug>(ale_previous_wrap)
nmap <silent> <C-k> <Plug>(ale_next_wrap)


" ===================================
" =========== gitgutter =============
" ===================================
nnoremap gf :GitGutterFold<CR>
nnoremap gh :GitGutterPreviewHunk<CR>
nnoremap [g :GitGutterPrevHunk<CR>
nnoremap ]g :GitGutterNextHunk<CR>


" ==================================
" =========== fugitive =============
" ==================================
noremap \g :Git


" =====================================
" =========== git-message =============
" =====================================
let g:git_messenger_no_default_mappings = v:true
nmap gm <Plug>(git-messenger)


" ===========================================
" =========== vim-terminal-help =============
" ===========================================
let g:terminal_key = '=='



" ===================================
" =========== omnisharp =============
" ===================================
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 0
let g:OmniSharp_selector_ui = 'ctrlp'
autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>


" ====================================
" =========== asynctasks =============
" ====================================
let g:asyncrun_open = 6
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
noremap <silent><f1> :AsyncTask file-run<cr>
noremap <silent><f2> :AsyncTask file-build<cr>


" ===============================
" =========== ctrlp =============
" ===============================
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'


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


" ===========================
" ======== emmet ==========
" ===========================
let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall
let g:user_emmet_leader_key='<M-m>'


" ==================================
" =========== bullets  =============
" ==================================
let g:bullets_enabled_file_types = [
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]


" =================================
" =========== rainbow =============
" =================================
let g:rainbow_active = 1


" ================================
" =========== recite =============
" ================================
let g:recite_default_storage = "/home/dmr/Documents/Notes/recite"
let g:recite_disable_default_keybindings = 1
nnoremap <m-e> :RecitePre<CR>
nnoremap <c-p> :ReciteOpen<CR>


" end
exec "nohlsearch"
