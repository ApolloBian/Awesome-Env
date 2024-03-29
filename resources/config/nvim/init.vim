" ===== Setup python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
if has('mac')
  let g:python3_host_prog = '/usr/local/bin/python3'
  let g:python_host_prog = '/usr/local/bin/python'
  let g:node_host_prog = '/usr/local/bin/neovim-node-host'
endif
" ===== NeoVim Specific tweak
"https://vi.stackexchange.com/questions/11221/is-there-an-incsearch-for-the-replace-command
set inccommand=nosplit      " highlight match during replace:

let g:completion_backend = 'ycm'
let g:completion_backend = 'coc'

" ===== Setup Vim-plug =====
let arc = substitute(system('uname | sed "s/\n//"'), '\r\|\n', '', '')
if empty(glob('~/.local/share/nvim/plugged'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')
" Eye candy
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/vim-emoji'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'ap/vim-css-color'
    Plug 'severin-lemaignan/vim-minimap'
" Color Scheme
    Plug 'projekt0n/github-nvim-theme'
    Plug 'nanotech/jellybeans.vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'ApolloBian/Retro.vim'
    Plug 'cocopon/colorswatch.vim'
    Plug 'sjl/badwolf'
    Plug 'fenetikm/falcon'
    Plug 'arcticicestudio/nord-vim'
    Plug 'cocopon/pgmnt.vim'  " template engine for vim color scheme by cocopon
    Plug 'cocopon/inspecthi.vim'
" QOL improvements
    Plug 'vim-scripts/BufOnly.vim'
    " Plug 'kshenoy/vim-signature'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Status line
    Plug 'itchyny/lightline.vim'
" Start screen
    Plug 'mhinz/vim-startify'
" Git
    Plug 'airblade/vim-gitgutter' " display line status on the left
    Plug 'APZelos/blamer.nvim'
" File browsing
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': {-> fzf#install()}}
    Plug 'junegunn/fzf.vim'
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ap/vim-buftabline'
" Programming
    Plug 'voldikss/vim-floaterm'
    " Plug 'MattesGroeger/vim-bookmarks'
    function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
            " python3 works way better than python2
            !python3 install.py
        endif
    endfunction

    function! InstallCocSources(info)
        if a:info.status == 'installed' || a:info.force
            CocInstall coc-json coc-dictionary coc-word coc-emoji coc-ultisnips coc-pyright coc-texlab
        endif
    endfunction

    if g:completion_backend == 'ycm'
        Plug 'Valloric/Youcompleteme', {'do': function('BuildYCM')}
    else
        Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('InstallCocSources')}
    endif
    " Plug 'ncm2/float-preview.nvim'
    " Plug 'davidhalter/jedi-vim'
    " Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    " Plug 'w0rp/ale'
    " Plug 'maximbaz/lightline-ale'
    " Plug 'ervandew/supertab'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'majutsushi/tagbar', {
        \'for': ['python']
        \}
    " Plug 'plytophogy/vim-virtualenv'
    Plug 'tpope/vim-commentary'
    Plug 'Vimjas/vim-python-pep8-indent'
    " Plug 'google/vim-maktaba'
    " Plug 'google/vim-codefmt'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-dispatch'
    Plug 'vim-python/python-syntax'
    Plug 'plasticboy/vim-markdown'
" Writing
    Plug 'chmp/mdnav'
" Web editing
    " Plug 'glacambre/firenvim'
    " Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
" Chinese input
    " Plug 'vim-scripts/VimIM'
call plug#end()



" ===== General Settings =====
set nocompatible       " Use Vim settings, rather than Vi settings (much better!).
                       " This must be first, because it changes other options as a side effect.
set list!              " show endl and tabs
" set listchars=tab:▸\ ,eol:¬                       " for more info, type :help listchars
set listchars=tab:▸\                        " I find the existance of eol sometimes not very pleasing
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set ruler              " show the cursor position all the time
set hlsearch           " highlight search
set ignorecase         " ignore case when searching
set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set numberwidth=5
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set scrolloff=8        " don't let the cursor touch the edge of the viewport
" set timeoutlen=100     " Lower ^[ timeout
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop            " use ~ to toggle case as an operator, not a motion
" set lazyredraw         " make macros faster
set ttyfast
set formatoptions-=r formatoptions-=c formatoptions-=o
set expandtab          " Expand tabs into spaces
set tabstop=4          " default to 2 spaces for a hard tab
set softtabstop=4      " default to 2 spaces for the soft tab
set shiftwidth=4       " for when <TAB> is pressed at the beginning of a line
set hidden             " allow edited buffers to be hidden
if !has('nvim')
    set clipboard=exclude:.*    " prevent vim from connecting to x11 on remote connection
endif
if has('mac')
    let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': 'pbcopy',
          \      '*': 'pbcopy',
          \    },
          \   'paste': {
          \      '+': 'pbpaste',
          \      '*': 'pbpaste',
          \   },
          \   'cache_enabled': 1,
          \ }
else
    let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': 'xclip -i -selection clipboard',
          \      '*': 'xclip -i -selection primary',
          \    },
          \   'paste': {
          \      '+': 'xclip -o -selection clipboard',
          \      '*': 'xclip -o -selection primary',
          \   },
          \   'cache_enabled': 1,
          \ }
endif

" quick open vimrc
command Cfg :e $MYVIMRC

" workarounds for background disappears when scrolling
let &t_ut=''
" zsh style command completion
set wildmenu
set wildmode=full
" remember more history, 200 will be more than useful
set history=200
" let mapleader=","
syntax on
if !(has('win32') || has('win64')) && !has("gui_running")
    " :W sudo write
    command! W w !sudo tee % > /dev/null
endif
if exists('&breakindent')
    set breakindent      " Indent wrapped lines up to the same level
endif
" set mouse=a
hi clear SignColumn     " We need this for plugins like Syntastic and vim-gitgutter which put symbols
                        " in the sign column.
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
" onoremap <silent> <expr> 0 ScreenMovement("0")
" onoremap <silent> <expr> ^ ScreenMovement("^")
" onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
" nnoremap <silent> <expr> 0 ScreenMovement("0")
" nnoremap <silent> <expr> ^ ScreenMovement("^")
" nnoremap <silent> <expr> $ ScreenMovement("$")

nnoremap <leader>x :bd<CR>

" shortcut for starting wiki
nnoremap <leader>ww :e $HOME/vimwiki/index.md \| cd %:h <CR>


" smooth movement for half PageUp PageDown
" noremap <silent> <c-u> :call smooth_scroll#up(float2nr(&scroll * 0.9), 16, 1)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(float2nr(&scroll * 1.0), 16, 1)<CR>

nnoremap <silent> <C-u> <PageUp>
nnoremap <silent> <C-d> <PageDown>

" set splitright          " Vertical splits use right half of screen
" set listchars=tab:▸\ ,space:·,eol:¬             " for more info, type :help listchars
set cursorline

" disable auto inserting comment for new lines, which is buggy
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ===== Make Vim look good =====
" more about true colors ':help xterm-true-color'
set termguicolors
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Mono:h13 " :set guifont? | this cmd gives current font
set guioptions=             " disable sidebars in gui
set encoding=utf-8
set laststatus=2
set noshowmode

" Change cursor shape between insert and normal mode in iTerm2.app
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
" https://github.com/kovidgoyal/kitty/issues/715
" This setting is for VTE compatible terminals (urxvt, st, xterm, gnome-terminal 3.x and others) 
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" set cursor shape when entering/exiting vim
" autocmd VimEnter * silent !print -n '\033[2 q'
" autocmd VimLeave * silent !print -n '\033[4 q'
" highlight Cursor guifg=white guibg=black

" Auto save & load session
" fu! SaveSess()
"     execute 'so ' . getcwd() . '/.session.vim'
"     if bufexists(1)
"         execute 'mksession! ' . getcwd() . '/.session.vim'
"     endif
" endfunction

" fu! RestoreSess()
" if filereadable(getcwd() . '/.session.vim')
"     execute 'so ' . getcwd() . '/.session.vim'
"     if bufexists(1)
"         for l in range(1, bufnr('$'))
"             if bufwinnr(l) == -1
"                 exec 'sbuffer ' . l
"             endif
"         endfor
"     endif
" endif
" endfunction
fu! SaveSess()
    if filereadable(getcwd() . '/.session.vim')
        execute 'mksession! ' . getcwd() . '/.session.vim'
    endif
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    if filereadable(getcwd() . '/.session.vim')
        execute 'so ' . getcwd() . '/.session.vim'
    endif
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()


" file templates for py, bash, etc
autocmd BufNewFile *.py 0r ~/.config/nvim/templates/python.py
autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/bash.sh


set background=light
hi clear Cursor
colorscheme retro

" lua << EOF
" require("github-theme").setup({
"   themeStyle = "light",
"   functionStyle = "italic",
"   sidebars = {"qf", "vista_kind", "terminal", "packer"},

"   -- Change the "hint" color to the "orange" color, and make the "error" color bright red
"   colors = {hint = "orange", error = "#ff0000"}
" })
" EOF

let g:lightline = {
            \'colorscheme': {},
            \'component': {},
            \'active':{},
            \'component_function':{}
            \}
let g:lightline.colorscheme = 'retro'
let g:lightline.active ={
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [],
            \       ['filename']],
            \   'right':[
            \['percent'],
            \['filetype']],
            \ }
if g:completion_backend == 'coc'
    let g:lightline.component = {
                \   'cocstatus': "%{coc#status()}%{get(b:,'coc_current_function','')}",
                \}
    call add(g:lightline.active.right, ['cocstatus'])
endif

if !(has('win32') || has('win64'))
    let var = system('hostname -s')
    let g:lightline_hostname = trim(var)
else
    let g:lightline_hostname = hostname()
endif
function! HostnameWrapper()
    return g:lightline_hostname
endfunction

let g:lightline.component_function = {
            \   'hostname': 'HostnameWrapper',
            \   'fileformat': 'MyFileformat',
            \   'filename': 'FilenameWithDetail',
            \}

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

let s:lightline_mode_chinese = 0
function! ToggleLightlineChinese()
    let s:lightline_mode_chinese = 1 - s:lightline_mode_chinese
    if s:lightline_mode_chinese == 0
        let g:lightline.mode_map = {}
        call LightlineReload()
    else
        let g:lightline.mode_map = {
                    \   'n': '普通模式',
                    \   'i': '插入模式',
                    \   'R': '替换模式',
                    \   'v': '可视模式',
                    \   'V': '可 视 行',
                    \   "\<C-v>": '可 视 块',
                    \   'c': '命令模式',
                    \   't': '终端模式',
                    \ }
        call LightlineReload()
    endif
endfunction
call ToggleLightlineChinese()
" let g:lightline.mode_map = {
"         \ 'n' : 'N',
"         \ 'i' : 'I',
"         \ 'R' : 'R',
"         \ 'v' : 'V',
"         \ 'V' : 'VL',
"         \ "\<C-v>": 'VB',
"         \ 'c' : 'C',
"         \ 's' : 'S',
"         \ 'S' : 'SL',
"         \ "\<C-s>": 'SB',
"         \ 't': 'T',
"       \ }
function! FilenameWithDetail()
  " TODO: winwidth?
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? '[+]' : ''
  let readonly = &readonly ? '[RO]': ''
  if &ft == 'python'
      let tagpos = tagbar#currenttag("%s", "", "f")
      if tagpos != ""
          let tagpos = '->' . tagpos
      endif
  else
      let tagpos = ""
  endif

  return readonly . modified . filename . tagpos
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  " return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  if &fileformat == 'unix'
      let ff_icon = ' 🐧'
  elseif &fileformat == 'mac'
      let ff_icon = ' '
  else
      let ff_icon = ' '
  endif
  return winwidth(0) > 70 ? (&fileformat . ff_icon):''
endfunction

function! SetALESignColor()
    if s:darkmode == 1
        hi ALEErrorSign term=reverse ctermfg=203 guifg=#e27878
        hi ALEWarningSign term=standout ctermfg=150 guifg=#d8e599
    else
        hi ALEErrorSign term=reverse ctermfg=203 guifg=#e27878
        hi ALEWarningSign term=standout ctermfg=150 guifg=#93999e
    endif
endfunction

" This function toggles dark mode (iceberg)
let s:darkmode = 0
function! ToggleDarkMode()
    if s:darkmode  == 1
        let s:darkmode = 0
        set noshowmode
        set noruler
        " set laststatus=0
        set noshowcmd
        set background=light
        colorscheme retro
        let g:lightline.colorscheme = 'retro'
        call LightlineReload()
        call SetALESignColor()
    else
        let s:darkmode = 1
        set showmode
        set ruler
        " set laststatus=2
        set showcmd
        set background=dark
        colorscheme iceberg
        let g:lightline.colorscheme = 'iceberg'
        call LightlineReload()
        call SetALESignColor()
    endif
endfunction


" if $TERM_THEME == 'iceberg'
"     call ToggleDarkMode()
" else
"     let s:darkmode = 1
"     call ToggleDarkMode()
" endif

nnoremap <leader>tw :call ToggleDarkMode()<CR>


hi Comment cterm=italic gui=italic

" hides cursorline in inactive buffers
" ref: https://superuser.com/questions/385553/making-the-active-window-in-vim-more-obvious
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" search configs
" prevent * and # from jumping to next
" stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
" Using # will blink, but * won't
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>
nnoremap <silent> # m`:keepjumps normal! #<cr>``

" clear highlight
map <leader>c :noh<cr>

" quit shortcut
nnoremap <leader>q :wqa<CR>

" Search highlight colors
" hi Search ctermfg=0 ctermbg=11 guifg=Black guibg=#FFDB72
" more colors for search, colors from vim-mark
" hi Search ctermfg=0 ctermbg=14 guifg=Black guibg=#8CCBEA  " blue
" hi Search ctermfg=0 ctermbg=10 guifg=Black guibg=#A4E57E  " green
" hi Search ctermfg=0 ctermbg=11 guifg=Black guibg=#FFDB72  " yellow
" hi Search ctermfg=0 ctermbg=9 guifg=Black guibg=#FF7272   " red
" hi Search ctermfg=0 ctermbg=13 guifg=Black guibg=#FFB3FF  " pink
" hi Search ctermfg=0 ctermbg=12 guifg=Black guibg=#9999FF  " purple

" ===== Plugin python-syntax
let g:python_highlight_string_formatting=1
let g:python_highlight_string_format=1
let g:python_highlight_string_templates=1
let g:python_highlight_class_vars=1
let g:python_highlight_file_headers_as_comments=1

" ===== Plugin vim-markdown =====
let g:vim_markdown_folding_disabled = 1 " disable auto folding
set conceallevel=0 "conceal bold, italic, url, etc
" set concealcursor=n "also conceal cursorline in normal mode
" let g:vim_markdown_fenced_languages=['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_strikethrough=1

" ===== Plugin auto-pairs =====
"same behavior for ^H and <BS>
imap <c-h> <BS>
let g:AutoPairsFlyMode=1

" ===== Plugin mdnav =====
let g:mdnav#Extensions='.md, .MD, .txt, .tex, .py' "All other extensions will not be opened in vim

" ===== Plugin vim-emoji =====
" working with youcompleteme
" https://github.com/junegunn/vim-emoji/issues/22
" Also
" https://junegunn.kr/2014/06/emoji-completion-in-vim
" Chaining mulitple completion functions section

" ===== Plugin vim-virtualenv =====
" let g:virtualenv_directory = '$HOME/.pyenv/versions/'
" set statusline+=%{virtualenv#statusline()}

" ===== Plugin vim-startify =====
let g:startify_change_to_vcs_root=1

" ===== Plugin CtrlP =====
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|pyc|jpeg|jpg|png|mat|zip|tar|tar.gz|bz2|swp|swo|xml)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" drastically improves ctrlp speed
" ref: https://stackoverflow.com/a/22784889
" let g:ctrlp_cache_dir = '$HOME/.cache/ctrlp'
if executable('ag')
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command ='fd --type file --color never "" %s'
  let g:ctrlp_user_command_async = 1
endif
map <C-t> :CtrlPBufTag<CR>
" ctrlp extensions
let g:ctrlp_extensions = ['tag', 'buffertag', 'changes']
" nnoremap <c-b> :CtrlPBuffer <CR>

" ====== Plugin fzf.vim
command! -bang -nargs=* BLines call fzf#vim#buffer_lines(<q-args>, {'options': '--no-reverse'}, <bang>0)
command! -bang -nargs=* BTags  call fzf#vim#buffer_tags(<q-args>, {'options': '--no-reverse'}, <bang>0)
nnoremap <c-b> :Buffers <CR>
nnoremap <c-t> :BTags <CR>
" nnoremap <leader>tt :Tags <CR>
nnoremap <c-p> :Files <CR>
nnoremap <c-s> :BLines  <CR>
let g:fzf_layout = {'down': '~40%'}
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'



" ===== Plugin ale =====
"始终开启标志列
let g:ale_enabled=0
let g:ale_sign_column_always = 0
" let g:ale_set_highlights = 1
"自定义error和warning图标
" let g:airline#extensions#ale#enabled = 1
" let g:ale_sign_error = '✗'
let g:ale_sign_error = ''
let g:ale_sign_error = ''
let g:ale_sign_error = ''
" let g:ale_sign_warning = '▲'
let g:ale_sign_warning = '•'

" TODO: modify this to be a function that can be called
" or to move the logic to Retro.vim
" I would like to configure a light theme and a dark theme
" same for gitgutter, I think I'll have most signs of default foreground
" color
" hi ALEErrorSign ctermbg=235 guibg=#1e2132
" hi ALEWarningSign ctermbg=235 guibg=#1e2132
hi clear ALEError
hi clear ALEWarning
hi clear ALEInfo
" hi ALEError gui=underline cterm=underline
" hi ALEWarning gui=underline cterm=underline
" hi ALEInfo gui=underline cterm=underline

"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '▲ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '▲'
let g:ale_echo_msg_format = '[%severity%][%linter%][%code%] %s'
" Noted that this option doesn't work for some linters, specifically, pylint
" https://github.com/dense-analysis/ale/issues/333
let g:ale_lint_on_text_changed = 'insert'
let g:ale_lint_on_enter = 1
" pylint only works when file is saved
let g:ale_lint_on_save = 1

let g:ale_lint_delay = 200 " this is the default value
let g:ale_linters = {
\    'python': ['pylint'],
\}
let g:ale_fixers = {
\   'python': ['yapf'],
\   'javascript': ['eslint'],
\   'cpp': ['clang-format'],
\}
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
nnoremap <leader>ff :ALEFix <CR>

" general formatting script
" This is complementary against ALEFix, in the future
" I can use custom commands for formatting files
" I can also define scirpts for different file types
" However, this does require reloading the file and lose 
" where you were. So maybe consider using alefix to implement
" this?
nnoremap <leader>fm :w <CR> :% !yapf % <CR>

" nnoremap <leader>e :w \| !python % <CR>
" autocmd FileType python nnoremap <c-e> :w \| !python3 % <CR>
" autocmd FileType python nnoremap <c-e> :w \| !cat testdata.txt 2>/dev/null \| python3 % <CR>
" autocmd FileType sh nnoremap <c-e> :w \| !bash % <CR>
function! SmartTest()
    if file_readable('vim_test.sh')
        !bash vim_test.sh
    else
        if &ft == 'python'
            !python %
        elseif &ft=='bash' || &ft == 'shell' || &ft == 'sh'
            !bash %
        endif
    endif
endfunction
" nnoremap <c-e> :w \| call SmartTest() <CR>
nnoremap <silent> <c-e> :silent w <bar> execute("!bash " . expand(stdpath('config') . '/custom/scripts/split_and_dispatch.sh') . ' ' . @%) <CR>



" ===== Plugin vim-easytags =====
" set tags=./tags " ;,~/.vimtags
" Sensible defaults
" let g:easytags_file = '~/.vim/tags'
let g:easytags_by_filetype = '~/.vim/tags/'
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ===== Plugin tagbar =====
" Open/close tagbar with \b
" nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
let g:tagbar_autofocus = 1
let g:tagbar_width = 60
highlight default link TagbarSignature Comment
highlight default link TagbarPseudoID Comment
" Increast the responsiveness of tagbar
" update time is the length of time vim waits after you stop typing before it
" triggers the plugin
" more info about this value :
" ref: https://www.reddit.com/r/vim/comments/3ql651/what_do_you_set_your_updatetime_to/
set updatetime=50 

" ===== Plugin vim-gitgutter =====
let g:airline#extensions#hunks#non_zero_only = 1
command GGU GitGutterUndoHunk
command GGN GitGutterNextHunk
command GGS GitGutterStageHunk

" ===== Plugin vim-pandoc-syntax
let g:pandoc#syntax#conceal#use = 0


" ===== Ultisnip =============
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"

" deprecated?
" let g:UltiSnipsSnippetsDir = $HOME."/.vim/customsnippets/"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "customsnippets"]


" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" ===== vimtex =====
" let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_matchparen_enabled = 0
let g:vimtex_mappings_enabled = 1
" let g:vimtex_view_method='skim'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'


" ===== Plugin delimitMate =====
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ===== Plugin jedi-vim
" let g:jedi#usages_command = "<leader>gu"
let g:jedi#rename_command = "<leader>r"
" The following lines are used to disable all other functionalities of
" jedi-vim
" for more settings, refer: https://github.com/davidhalter/jedi-vim#settings
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = ""
" let g:jedi#goto_assignments_command = "<leader>ga"
" let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command = ""
let g:jedi#completions_command = ""
let g:jedi#auto_initialization = 1
let g:jedi#show_call_signatures_delay = 10
let g:jedi#show_call_signatures = 0
" call jedi#configure_call_signatures()
function! ToggleSignature()
    if g:jedi#show_call_signatures == 1
        let g:jedi#show_call_signatures = 0
    else
        let g:jedi#show_call_signatures = 1
    endif
endfunction

nnoremap <leader>tj :call ToggleSignature()<CR>

if g:completion_backend == 'ycm'
" ===== Plugin Youcompleteme =====
"  disable for mediawiki, latex and markdown
let g:ycm_filetype_blacklist = {
    \ 'jsx': 1,
    \ 'xml': 1,
    \ 'html': 1}
set splitbelow


let g:ycm_collect_identifiers_from_tags_files = 1
autocmd FileType markdown set tags+=$HOME/.config/nvim/custom/tags/markdown.tags
autocmd FileType tex set tags+=$HOME/.config/nvim/custom/tags/latex.tags

let g:ycm_python_binary_path = "python"     " use env python as python bin
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_insertion = 0
set completeopt-=preview
" Discussion ref: https://github.com/ycm-core/YouCompleteMe/issues/3458
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToType<CR>
nnoremap gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gu :YcmCompleter GoToReferences<CR>
" nnoremap M :YcmCompleter GetDoc<CR>
let g:ycm_key_invoke_completion = '<C-n>'

" semantic triggers
" ref:https://github.com/Valloric/YouCompleteMe/issues/2961

let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

let g:ycm_semantic_triggers['python'] = [
    \ '.',
    \ 're!(import\s+|from\s+([\w.]+\s+(import\s+([\w.]+,\s+)*)?)?)',
    \ 're!(\w{2,})',
    \ ', ',
    \]
    " \'re!import\s+',
    " \'re!from\s+(\w+\s+import\s+)?',
    " \'re!from\s+[\w.]+\s+import\s+(\w+,\s+)*',
" let g:ycm_min_num_of_chars_for_completion = 15


" let g:ycm_global_ycm_extra_conf = "~/.ycm_global_extra_conf.py"
" autocmd VimLeave * silent !pkill -P $PPID

" floating window preview for ycm (ycm floating window only support vim not nvim)
function s:Hover()
    " get the doc string from YCM
    let response = youcompleteme#GetCommandResponse('GetDoc')
    if response == ''
        return
    endif
    " set the width
    let s:width = min([winwidth('%') * 9 / 10, 100])
    " calculate the height to show the whole doc with wrap enabled
    let lines = split(response, '\n')
    let s:height = len(lines) + 1
    for s:line in lines
        let s:height = s:height + len(s:line) / s:width
    endfor
    " nvim floating window interface
    let buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(buf, 0, -1, v:true, lines)
    let opts = {'relative': 'cursor', 'width': s:width, 'height': len(lines), 'col': 0,
                \ 'row': 1, 'anchor': 'NW', 'style': 'minimal'}
    let s:win = nvim_open_win(buf, 0, opts)
    " set the window option
    call nvim_win_set_option(s:win, 'winhl', 'Normal:NormalFloat')
    call nvim_win_set_option(s:win, 'wrap', v:true)
    call nvim_win_set_option(s:win, 'linebreak', v:true)
    " close the window once the cursor moved
    autocmd CursorMoved <buffer> ++once call nvim_win_close(s:win, v:false)
endfunction

command YcmGetDocFloatWin :call <SID>Hover()
autocmd FileType c,cpp,h,hpp,python nmap M :YcmGetDocFloatWin<cr>

else
" ============== coc.nvim ================
if has('mac')
    let g:coc_node_path = '/usr/local/bin/node'
endif

command CCM CocCommand

" set completeopt-=preview
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" cursor disappear after CocList
" https://github.com/neoclide/coc.nvim/issues/1775
let g:coc_disable_transparent_cursor = 1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-n> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <c-n> <Plug>(coc-diagnostic-next)

" toggle diagnostics
" nnoremap <leader>tt :call CocAction('diagnosticToggle')<CR>
nnoremap <leader>tt :call CocAction('diagnosticToggleBuffer')<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> M :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    " call CocAction('doHover')
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
hi CocHighlightText guifg=Black guibg=#A4E57E
hi link CocHighlightRead  CocHighlightText
hi link CocHighlightWrite  CocHighlightText
" disable autohight for now
" autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Formatting selected code.
nmap <leader>fm <Plug>(coc-format)
xmap <leader>fm <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver

" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" CocList diagnostics
" Manage extensions.
" CocList extensions
" Show commands.
" CocList commands
" Find symbol of current document.
" CocList outline
" Search workspace symbols.
" CocList -I symbols
" Do default action for next item.
" CocNext
" Do default action for previous item.
" CocPrev
" Resume latest coc list.
" CocListResume
endif

" ================ vim-buftabline ========================
nnoremap <c-l> :bnext<CR>
nnoremap <c-h> :bprev<CR>
let g:buftabline_numbers=1
let g:buftabline_indicators=1

" ===== important keymaps =====
" map <C-t> :TagbarToggle<CR>
" nmap <S-p> <Plug>(ale_previous_wrap)
" nmap <S-n> <Plug>(ale_next_wrap)
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"<Leader>s触发/关闭语法检查
" nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
" nmap <Leader>d :ALEDetail<CR>
" Ctrl p search files

" F1 for executing current script
" remove the last CR so that I have to press ENTER to confirm
" feels more secure
" <bar> semantics : https://stackoverflow.com/questions/3249275/vim-multiple-commands-on-same-line
" map <F1> :w <bar> windo only <bar> term ./%
map <F1> :w <bar> !./% <CR>
" map <leader>ts :w <bar> !./%
" F1 was used to show help.txt
" :help will do the same trick tho

nnoremap <leader>hi :let @/=

" #TODO:
" scroll between buffer ? liu chen yu's vimrc

" ============ Filetype dependent tweaks: =======================
" === python files ===
autocmd FileType python set nowrap

" === txt files ===
" autocmd filetype text set linebreak          " wrap lines on 'word' boundaries
autocmd filetype text,tex,markdown set linebreak
autocmd filetype text,tex,markdown set wrap          " wrap lines on 'word' boundaries
autocmd filetype text,tex,markdown set shiftwidth=2

" ==== vim-floaterm
command IPython :FloatermNew --width=0.7 --height=0.6 --autoclose=2 ipython

" " ===== telescope
" lua << EOF
" local actions = require('telescope.actions')
" require('telescope').setup({
"   defaults = {
"     layout_strategy = "vertical",
"     layout_config = {
"         height = 30,
"         prompt_position = 'bottom',
"     },
"     mappings = {
"       i = {
"         ["<esc>"] = actions.close, -- Does not work
"       },
"     },
"   },
" })
" EOF
" nnoremap <c-b> :Telescope buffers <CR>
" nnoremap <c-t> :Telescope current_buffer_tags <CR>
" " nnoremap <leader>tt :Tags <CR>
" nnoremap <c-p> :Telescope find_files <CR>
" " TODO: silversearcher-ag:
" " https://github.com/nvim-telescope/telescope.nvim/issues/18
