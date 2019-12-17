" ===== Setup python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
" ===== NeoVim Specific tweak
"https://vi.stackexchange.com/questions/11221/is-there-an-incsearch-for-the-replace-command
set inccommand=nosplit      " highlight match during replace:


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
" Color Scheme
    Plug 'nanotech/jellybeans.vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'ApolloBian/Retro.vim'
    Plug 'cocopon/colorswatch.vim'
    Plug 'sjl/badwolf'
    Plug 'fenetikm/falcon'
    Plug 'arcticicestudio/nord-vim'
    Plug 'cocopon/pgmnt.vim'  " template engine for vim color scheme by cocopon
    Plug 'cocopon/inspecthi.vim'
" Status line
    Plug 'itchyny/lightline.vim'
" Start screen
    Plug 'mhinz/vim-startify'
" Git
    Plug 'airblade/vim-gitgutter' " display line status on the left
" File browsing
    Plug 'junegunn/fzf', {'dir': '~/.fzf'}
    Plug 'junegunn/fzf.vim'
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ap/vim-buftabline'
" Programming
    function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
            " python3 works way better than python2
            !python3 install.py --clang-completer
        endif
    endfunction
    " Plug 'Valloric/Youcompleteme', {'do': function('BuildYCM')}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mileszs/ack.vim'
    " Plug 'davidhalter/jedi-vim'
    " Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    " Plug 'w0rp/ale'
    " Plug 'maximbaz/lightline-ale'
    " Plug 'ervandew/supertab'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'majutsushi/tagbar'
    " Plug 'plytophogy/vim-virtualenv'
    Plug 'tpope/vim-commentary'
    Plug 'Vimjas/vim-python-pep8-indent'
    " Plug 'google/vim-maktaba'
    " Plug 'google/vim-codefmt'
    Plug 'tpope/vim-dispatch'
    Plug 'vim-python/python-syntax'
" Web editing
    " Plug 'glacambre/firenvim'
    Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
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
set lazyredraw         " make macros faster
set ttyfast
set formatoptions-=r formatoptions-=c formatoptions-=o
set expandtab          " Expand tabs into spaces
set tabstop=4          " default to 2 spaces for a hard tab
set softtabstop=4      " default to 2 spaces for the soft tab
set shiftwidth=4       " for when <TAB> is pressed at the beginning of a line
set hidden             " allow edited buffers to be hidden
set pumheight=10       " completion menu height
if !has('nvim')
    set clipboard=exclude:.*    " prevent vim from connecting to x11 on remote connection
endif
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

" set splitright          " Vertical splits use right half of screen
" set listchars=tab:▸\ ,space:·,eol:¬             " for more info, type :help listchars
set cursorline


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


" file templates for py, bash, etc
autocmd BufNewFile main.py 0r ~/.vim/templates/python_main.py
autocmd BufNewFile *.py 0r ~/.vim/templates/python.py
autocmd BufNewFile *.sh 0r ~/.vim/templates/bash.sh


set background=light
colorscheme retro
let g:lightline = {
            \'colorscheme': {},
            \'component': {},
            \'active':{},
            \'component_function':{}
            \}
let g:lightline.colorscheme = 'retro'
let g:lightline.component = {
            \   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
            \   'cocstatus': "%{coc#status()}%{get(b:,'coc_current_function','')}",
            \}
let g:lightline.active ={
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       ['hostname'],
            \       ['filename']],
            \   'right':[
            \['percent'],
            \['filetype'],
            \['cocstatus']],
            \ }
let g:lightline.component_function = {
            \   'hostname': 'hostname',
            \   'fileformat': 'MyFileformat',
            \   'filename': 'FilenameWithDetail',
            \}
function! FilenameWithDetail()
  " TODO: winwidth?
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? '[+]' : ''
  let readonly = &readonly ? '[RO]': ''
  let tagpos = tagbar#currenttag("%s", "", "f")
  if tagpos != ""
      let tagpos = '->' . tagpos
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

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
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
nnoremap <leader>q :wqa

" Search highlight colors
hi Search ctermfg=0 ctermbg=11 guifg=Black guibg=#FFDB72
" more colors for search, colors from vim-mark
" hi Search ctermfg=0 ctermbg=14 guifg=Black guibg=#8CCBEA  " blue
" hi Search ctermfg=0 ctermbg=10 guifg=Black guibg=#A4E57E  " green
" hi Search ctermfg=0 ctermbg=11 guifg=Black guibg=#FFDB72  " yellow
" hi Search ctermfg=0 ctermbg=9 guifg=Black guibg=#FF7272   " red
" hi Search ctermfg=0 ctermbg=13 guifg=Black guibg=#FFB3FF  " pink
" hi Search ctermfg=0 ctermbg=12 guifg=Black guibg=#9999FF  " purple

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
nnoremap <leader>tt :Tags <CR>
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
" nmap <silent> <C-n> <Plug>(ale_next_wrap)

" general formatting script
" This is complementary against ALEFix, in the future
" I can use custom commands for formatting files
" I can also define scirpts for different file types
" However, this does require reloading the file and lose 
" where you were. So maybe consider using alefix to implement
" this?
" nnoremap <leader>fm :w <CR> :% !yapf % <CR>


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

" ===== Plugin vim-pandoc-syntax
let g:pandoc#syntax#conceal#use = 0


" ===== Ultisnip =============
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"

let g:UltiSnipsSnippetsDir = $HOME."/.vim/customsnippets/"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "customsnippets"]


" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" ===== vimtex =====
" let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_matchparen_enabled = 0
let g:vimtex_mappings_enabled = 1
" let g:vimtex_view_method='skim'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'

" ===== coc.nvim =====
" more functions refer to: https://zhuanlan.zhihu.com/p/65524706
" coc-pairs, coc-snippets, coc-yank, coc-git
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-n> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> <C-n> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use M to show documentation in preview window
nnoremap <silent> M :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>fm  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <leader>fm :call CocAction('format')<CR>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')



" ===== Plugin delimitMate =====
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


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
autocmd filetype text set linebreak          " wrap lines on 'word' boundaries
autocmd filetype text set wrap

" === tex files ===
autocmd filetype tex set linebreak
autocmd filetype tex set wrap
