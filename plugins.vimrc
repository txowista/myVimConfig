" vim: syntax=vim fdm=marker ts=2 sts=2 sw=2 fdl=0
let g:plug_threads=16
let g:plug_timeout=600
let g:plug_retries=2

let $GIT_SSL_NO_VERIFY = 'true'
let $GIT_TERMINAL_PROMPT = 0

Plug 'haya14busa/incsearch.vim' "{{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"}}}

Plug 'altercation/vim-colors-solarized'
Plug 'rhysd/vim-clang-format' "{{{
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
"}}}
Plug 'sheerun/vim-polyglot' "{{{
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"}}}

Plug 'junegunn/vim-plug'
Plug 'junegunn/vim-easy-align'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'   "{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"  let g:UltiSnipsSnippetsDir=g:VIMPATH.'/snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "Usnippets"]
"}}}

if !empty(glob("/usr/bin/python2"))
  Plug 'Valloric/YouCompleteMe'  , { 'do': 'python2 install.py --clang-complete' ,'tag':'9968a43f7ec058298667c2c56ca86cfbbf1dac51'} "{{{
  let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
  let g:ycm_complete_in_comments_and_strings=0
  let g:ycm_collect_identifiers_from_comments_and_strings = 0
  let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
  let g:ycm_filetype_blacklist={'unite': 1}
  let g:ycm_min_num_of_chars_for_completion = 2
  let g:ycm_open_loclist_on_ycm_diags = 1
  noremap <leader>F :YcmCompleter FixIt<cr>

  command! YcmFixIt :YcmCompleter FixIt
  command! YcmGetDoc :YcmCompleter GetDoc
  command! TcmGoToInclude :YcmCompleter GoToInclude
  command! TcmGoToDeclaration :YcmCompleter GoToDeclaration
  command! TcmGoToDefinition :YcmCompleter GoToDefinition

else
  if !empty(glob("/usr/bin/python"))
  Plug 'Valloric/YouCompleteMe'  , { 'do': 'python install.py --clang-complete' ,'tag':'9968a43f7ec058298667c2c56ca86cfbbf1dac51'} "{{{

    let g:ycm_path_to_python_interpreter = '/usr/bin/python'
    let g:ycm_complete_in_comments_and_strings=0
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
    let g:ycm_filetype_blacklist={'unite': 1}
    let g:ycm_min_num_of_chars_for_completion = 2
    let g:ycm_open_loclist_on_ycm_diags = 1
    noremap <leader>F :YcmCompleter FixIt<cr>

    command! YcmFixIt :YcmCompleter FixIt
    command! YcmGetDoc :YcmCompleter GetDoc
    command! TcmGoToInclude :YcmCompleter GoToInclude
    command! TcmGoToDeclaration :YcmCompleter GoToDeclaration
    command! TcmGoToDefinition :YcmCompleter GoToDefinition


  endif
endif

"}}}


Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}


if has('nvim')
  " Plug 'benekastah/neomake' "{{{
  " autocmd MyAutoCmd BufWritePost,BufEnter *.c,*.h Neomake
  " autocmd MyAutoCmd InsertChange,TextChanged *.c,*.h update | Neomake
  "
  " autocmd! BufWritePost * Neomake
  " "}}}

  Plug 'critiqjo/lldb.nvim'
  Plug 'scrooloose/syntastic' "{{{
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'
  "}}}

else
  Plug 'scrooloose/syntastic' "{{{
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = '✠'
  let g:syntastic_warning_symbol = '∆'
  let g:syntastic_style_warning_symbol = '≈'
  "}}}
endif

Plug 'vim-scripts/wombat256.vim'

Plug 'vim-scripts/matchit.zip'

Plug 'tpope/vim-abolish'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'
Plug 'alepez/vim-gtest'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim' "{{{
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_max_height=40
let g:ctrlp_show_hidden=1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=20000
let g:ctrlp_cache_dir=g:VIMPATH .'/ctrlp'
let g:ctrlp_reuse_window='startify'
let g:ctrlp_extensions=['funky']
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git|hg|svn|idea)$',
      \ 'file': '\v\.DS_Store$'
      \ }
if executable('ag')
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
endif

nmap \ [ctrlp]
nnoremap [ctrlp] <nop>

nnoremap [ctrlp]t :CtrlPBufTag<cr>
nnoremap [ctrlp]T :CtrlPTag<cr>
nnoremap [ctrlp]l :CtrlPLine<cr>
nnoremap [ctrlp]o :CtrlPFunky<cr>
nnoremap [ctrlp]b :CtrlPBuffer<cr>
command! Buffers  :CtrlPBuffer
command! MRU      :CtrlPMRUFiles
"}}}

Plug 'noahfrederick/vim-skeleton' "{{{
let g:skeleton_template_dir = g:VIMPATH . "/templates"
let g:skeleton_replacements = {}
function! g:skeleton_replacements.CHEADERNAME()
  let s:inc = toupper(fnamemodify(expand("%"), ':p:.:r:gs?/?_?')) 
  return s:inc."_H_"
endfunction
"}}}
Plug 'vim-scripts/doxygen-support.vim'
Plug 'vim-scripts/DoxygenToolkit.vim' "{{{

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName= g:author
"}}}

Plug 'airblade/vim-gitgutter' , {'tag': '530bf68fcaf7a34ac17a9a4f4ce3f4309a272e27'}

Plug 'tpope/vim-fugitive' "{{{
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>
autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}
"

Plug 'kien/rainbow_parentheses.vim' "{{{
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
let g:rbpt_max = 9
let g:rbpt_loadcmd_toggle = 0
autocmd MyAutoCmd VimEnter * RainbowParenthesesToggle
autocmd MyAutoCmd Syntax * RainbowParenthesesLoadRound
autocmd MyAutoCmd Syntax * RainbowParenthesesLoadSquare
autocmd MyAutoCmd Syntax * RainbowParenthesesLoadBraces


"}}}


Plug  'gregsexton/gitv' "{{{
nnoremap <silent> <leader>gv :Gitv<CR>
nnoremap <silent> <leader>gV :Gitv!<CR>

"}}}


Plug 'tpope/vim-endwise'

Plug 'terryma/vim-expand-region' "{{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"}}}


Plug 'terryma/vim-multiple-cursors',{'tag':'b1121df3c627dc3dc21356ba440e68b9458c083a'} "{{{
let g:multi_cursor_exit_from_insert_mode = 0
"}}}

Plug 'tomtom/tcomment_vim'
Plug 'chrisbra/NrrwRgn'
Plug 'junegunn/vim-easy-align'"{{{
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
"}}}


" Plug 'godlygeek/tabular' "{{{
" "autocmd MyAutoCmd VimEnter * Tabularize
" nmap <Leader>a& :Tabularize /&<CR>
" vmap <Leader>a& :Tabularize /&<CR>
" nmap <Leader>a= :Tabularize /=<CR>
" vmap <Leader>a= :Tabularize /=<CR>
" nmap <Leader>a: :Tabularize /:<CR>
" vmap <Leader>a: :Tabularize /:<CR>
" nmap <Leader>a:: :Tabularize /:\zs<CR>
" vmap <Leader>a:: :Tabularize /:\zs<CR>
" nmap <Leader>a, :Tabularize /,<CR>
" vmap <Leader>a, :Tabularize /,<CR>
" nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" vmap <Leader>ad :Tabularize /\/\/\/<<CR>
" "}}}



Plug 'vim-airline/vim-airline'  "{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '¦'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let g:airline#extensions#tabline#fnamemod = ':p:'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"}}}


Plug 'mbbill/undotree' "{{{
"autocmd MyAutoCmd VimEnter * UndotreeToggle
let g:undotree_WindowLayout='botright'
let g:undotree_SetFocusWhenToggle=1
nnoremap <silent> <F5> :UndotreeToggle<CR>
"}}}

Plug 'nathanaelkane/vim-indent-guides' "{{{
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=3
" let g:indent_guides_auto_colors=0
" function! s:indent_set_console_colors()
"   hi IndentGuidesOdd ctermbg=235
"   hi IndentGuidesEven ctermbg=236
" endfunction
" autocmd MyAutoCmd VimEnter,Colorscheme * call s:indent_set_console_colors()
"}}}

Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim' "{{{
let g:tmuxcomplete#trigger = 'omnifunc'
"}}}

Plug 'benmills/vimux' "{{{
map <leader>x :VimuxPromptCommand<CR>
"}}}



Plug 'aklt/plantuml-syntax' "{{{
let g:plantuml_executable_script='java -jar /opt/plantuml/plantuml.jar'
"let g:plantuml_executable_script='java -jar c:\utils\plantuml\plantuml.jar'
au FileType * execute 'setlocal dict+='.g:VIMPATH .'/words/' .&filetype.'.adoc'
"}}}

Plug 'bufkill.vim'

Plug 'mhinz/vim-startify' "{{{

let g:startify_session_dir = VIMPATH . '/sessions'
let g:startify_change_to_vcs_root = 1
let g:startify_show_sessions = 1
"}}}
"
Plug 'embear/vim-localvimrc'



Plug 'kshenoy/vim-signature'

Plug 'hail2u/vim-css3-syntax'




" Plug 'plasticboy/vim-markdown',{ 'for': ['markdown', 'mkd'] }


Plug 'jelera/vim-javascript-syntax'



if  executable('instant-markdown-d')  "{{{
  " "[sudo] npm -g install instant-markdown-d
  "if executable('redcarpet') && executable('instant-markdown-d') 
  "# "If you're on Linux, the xdg-utils package needs to be installed (is installed by default on Ubuntu).
  Plug  'suan/vim-instant-markdown' ,{ 'for': ['markdown', 'mkd'] } 
endif
"}}}


Plug 'cespare/vim-toml',{'for': 'toml'}

Plug 'elzr/vim-json',{'for': 'json'}

Plug 'tpope/vim-sleuth'

Plug 'lambdalisue/vim-gita' "{{{
nnoremap <silent> [Space]gs  :<C-u>Gita status<CR>
nnoremap <silent> [Space]gc  :<C-u>Gita commit<CR>
nnoremap <silent> [Space]ga  :<C-u>Gita commit --amend<CR>
nnoremap <silent> [Space]gd  :<C-u>Gita diff<CR>
nnoremap <silent> [Space]gb  :<C-u>Gita browse<CR>
nnoremap <silent> [Space]gl  :<C-u>Gita blame<CR>
let gita#features#commit#enable_default_mappings = 0
"}}}

Plug 'wesgibbs/vim-irblack'
Plug 'vim-scripts/wombat256.vim'

Plug 'osyo-manga/vim-jplus' "{{{
nmap J <Plug>(jplus)
vmap J <Plug>(jplus)
"}}}


Plug'soramugi/auto-ctags.vim', { 'for' : ['c' , 'cpp'] } "{{{
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
"}}}


Plug 'vim-scripts/a.vim' , { 'for' : ['c' , 'cpp'] }


"Plug 'easymotion/vim-easymotion' "{{{
"nmap w <Plug>(easymotion-lineforward)
"nnoremap W     w
"nmap b <Plug>(easymotion-linebackward)
"nnoremap B     b
"nmap <leader>j <Plug>(easymotion-j)
"nmap <leader>k <Plug>(easymotion-k)
"nmap <leader>' <Plug>(easymotion-prefix)

"let g:EasyMotion_startofline = 0
"let g:EasyMotion_show_prompt = 1
"let g:EasyMotion_verbose = 0
""}}}
Plug 'chrisbra/NrrwRgn'
Plug 'craigemery/vim-autotag'
Plug 'chrisbra/vim-diff-enhanced' "{{{
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
"}}}
Plug 'majutsushi/tagbar' "{{{
nnoremap<leader>t :TagbarToggle<cr>
"}}}


Plug 'ryanoasis/vim-devicons'   "{{{
set encoding=utf8
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:airline_powerline_fonts = 1
"}}}
Plug 'vim-scripts/SyntaxRange'


Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'Chiel92/vim-autoformat'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree' "{{{
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" call NERDTreeHighlightFile('cpp', 'green', 'none', 'green', '#141e23')x"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#141e23')
call NERDTreeHighlightFile('toml', 'Magenta', 'none', '#ff00ff', '#141e23')
call NERDTreeHighlightFile('cpp', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')

"}}}


Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/Conque-GDB' "{{{ 
let g:ConqueGdb_Leader = '-'
""}}}

Plug 'Valloric/MatchTagAlways'
Plug  'Xuyuanp/nerdtree-git-plugin'
Plug 'jreybert/vimagit'
Plug 'quark-zju/vim-cpp-auto-include' "{{{
command! Includes      :ruby CppAutoInclude::process
"}}}
"
Plug 'dagwieers/asciidoc-vim'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/SyntaxRange' "{{{

function! AsciidocEnableSyntaxRanges()
  " source block syntax highlighting
  if exists('g:loaded_SyntaxRange')
    for lang in ['c', 'python', 'vim', 'javascript', 'cucumber', 'xml', 'typescript', 'sh', 'java', 'cpp', 'sh']
      call SyntaxRange#Include(
            \  '\c\[source\s*,\s*' . lang . '.*\]\s*\n[=-]\{4,\}\n'
            \, '\]\@<!\n[=-]\{4,\}\n'
            \, lang, 'NonText')
    endfor

    call SyntaxRange#Include(
          \  '\c\[source\s*,\s*gherkin.*\]\s*\n[=-]\{4,\}\n'
          \, '\]\@<!\n[=-]\{4,\}\n'
          \, 'cucumber', 'NonText')
  endif
endfunction"
call AsciidocEnableSyntaxRanges()
"}}}

Plug 'tpope/vim-markdown' "{{{

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']


function! MarkdownEnableSyntaxRanges()
  " source block syntax highlighting
  if exists('g:loaded_SyntaxRange')
    for lang in ['c', 'python', 'vim', 'javascript', 'cucumber', 'xml', 'typescript', 'sh', 'java', 'cpp', 'sh', 'php', 'yaml']
      call SyntaxRange#Include(
            \  '^```' . lang . '$'
            \, '^```$'
            \, lang, 'NonText')
    endfor

    " exception for gherkin, since the syntax file is named cucumber
    call SyntaxRange#Include(
          \  '^```gherkin$'
          \, '^```$'
          \, 'cucumber', 'NonText')
  endif
endfunction

call MarkdownEnableSyntaxRanges()

"}}}
