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
set vb t_vb=

" 基于缩进或语法进行代码折叠
" zf 创建  zc 折叠  zo 打开  [z  ]z   zj  zk 在折叠间移动
"set foldmethod=indent
set foldmethod=manual
set foldenable

noremap <LEADER><CR> :nohlsearch<CR>

noremap i k
noremap j h
noremap h i
noremap k j
noremap K 5j
noremap I 5k
noremap H I
noremap Q q
noremap Z Q

" 跳转文件
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR> 
noremap <C-b> :w<CR>:bd<CR>
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

map <C-up> :res -1<CR>
map <C-down> :res +1<CR>
map <C-left> :vertical resize+1<CR>
map <C-right> :vertical resize-1<CR>

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
    "Plug 'nathanaelkane/vim-indent-guides'
    Plug 'mg979/vim-xtabline'
    "Plug 'rbong/vim-crystalline'
    "Plug 'liuchengxu/eleline.vim'
    Plug 'bling/vim-bufferline'
    Plug 'vim-airline/vim-airline'
    " ????
    Plug 'Yggdroot/indentLine'
    Plug 'wincent/terminus'
    Plug 'luochen1990/rainbow'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'connorholyday/vim-snazzy'
    Plug 'ajmwagar/vim-deus'
    Plug 'morhetz/gruvbox'
    Plug 'ryanoasis/vim-devicons'

    "Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-bash'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'     "<C-y>,
    Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
    Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
    Plug 'mbbill/undotree'

    " 查找文件
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
    Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

    " 中文文档
    "Plug 'yianwillis/vimcdoc'
    Plug 'junegunn/goyo.vim' " distraction free writing mode
    Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'`to change 'word' to `word`
    Plug 'AndrewRadev/switch.vim' " gs 
    Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line <space>
    Plug 'itchyny/calendar.vim'
    Plug 'liuchengxu/vista.vim'
    Plug 'junegunn/vim-peekaboo'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'mhinz/vim-startify'               
    Plug 'brooth/far.vim'                   " :Far
    Plug 'dkarter/bullets.vim'              "<C-t> <C-d>
    Plug 'tpope/vim-capslock'               "<C-l> capslock
    Plug 'rhysd/clever-f.vim'               "fsfff
    Plug 'reedes/vim-wordy'
    Plug 'ron89/thesaurus_query.vim'
    Plug 'kshenoy/vim-signature'            "Bookmarks  mx   dmx    m<Space> m,
    Plug 'vimwiki/vimwiki'
    Plug 'dense-analysis/ale'
    "Plug 'svermeulen/vim-subversive'

call plug#end()

" enable true colors support
set termguicolors	
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
color deus


" =====================================
" =========== crystalline =============
" =====================================
"function! TabLine()
    "let l:vimlabel = 'dmr-arch '
    "return crystalline#bufferline(0, 0, 1) . '%=%#CrystallineTab# ' . l:vimlabel
"endfunction
"let g:crystalline_enable_sep = 1
"let g:crystalline_tabline_fn = 'TabLine'
"let g:crystalline_theme = 'gruvbox'
"set showtabline = 2


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


" ==============================
" ======== indentLine ==========
" =============================
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_bgcolor_term = 202
nmap <Leader>t :IndentLinesToggle<CR>


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


" ====================================
" =========== vimspector =============
" ====================================
let g:vimspector_enable_mappings = 'HUMAN'
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


" ===================================
" ======== MarkdownPreview ==========
" ===================================
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
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
map ud :UndotreeToggle<CR><LEADER>j<LEADER>i


" ================================
" =========== rnvimr =============
" ================================
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
nnoremap <silent> R :RnvimrSync<CR>:RnvimrToggle<CR>


" ===========================
" ========= fzf =============
" ===========================
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


" ===========================
" ========== coc ============
" ===========================
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
let g:coc_global_extention = ['coc-tsserver', 'coc-translator', 'coc-json', 'coc-explorer', 'coc-python', 'coc-snippets', 'coc-yank', 'coc-pairs', 'coc-lists', 'coc-highlight', 'coc-css', 'coc-html', 'coc-gitignore', 'coc-todolist', 'coc-actions']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <C-c> :CocCommand<CR>
nnoremap <C-l> :CocList<CR>
" coc-python
nmap <leader>rn <Plug>(coc-rename)
" coc-explorer
nmap ne :CocCommand explorer<CR>
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


" ===========================
" ========== ale ============
" ===========================
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


" ============================
" ======== multiple ==========
" ============================
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ===========================
" ======== emmit ==========
" ===========================
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-m>'


" ==================================
" =========== bullets  =============
" ==================================
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]


" ========================================
" =========== vim-subversive =============
" ========================================


" =================================
" =========== rainbow =============
" =================================
let g:rainbow_active = 1


" =========================================
" =========== thesaurus_query =============
" =========================================
let g:tq_map_keys = 0
nnoremap <unique> <C-s> :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <unique> <C-s> "ky:ThesaurusQueryReplace <C-r>k<CR>


" end
exec "nohlsearch"
