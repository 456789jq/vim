" plugins here ###################################
call plug#begin('~/.vim/plugged')
Plug 'dstein64/vim-startuptime'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic' " syntax checking/highilghting
Plug 'nvie/vim-flake8' " PEP 8 checking with this nifty little plugin
Plug 'tpope/vim-fugitive' " git integration
" I don't kown is install those plugin let js with vim work or just this config file some value error poblem.
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'

" html css autocomplete
Plug 'alvan/vim-closetag'

Plug  'folke/tokyonight.nvim', {'brach': 'main'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'hoob3rt/lualine.nvim'
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'morhetz/gruvbox' " color scheme plugin
" Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'

" intalling coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" a manager style for vim or neovim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autochange input method
Plug 'rlue/vim-barbaric'

" scheme
Plug 'rebelot/kanagawa.nvim'

" preview markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

call plug#end()
execute pathogen#infect()
" has be deleted plugin:
" Plug 'plasticboy/vim-markdown'
" vim-instant-markdown
let g:instant_markdown_mathjax = 1

" airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'default'

" setting value here ##############################

syntax on			" Enable syntac highlighting.
filetype plugin indent on	" Enable file type based indentation.
filetype plugin on
set nocompatible  " for vimwiki ，是否与vim兼容

" may be it is switch between leaving insert mode time
set ttimeoutlen=0

let mapleader = ","

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" this au is  autocammand 
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=4
    \ set softtabstop=2
    \ set shiftwidth=2

"let g:livepreview_previewer = "open -a 'Google Chrome'"
let g:livepreview_previewer = "open -a Preview"
" autocmd Filetype tex setl updatetime=1
"let g:livepreview_previewer = 'open -a texshop'
" let g:livepreview_engine = "luatex"
let g:livepreview_engine = "xelatex"
let g:livepreview_cursorhold_recompile = 0

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

let python_highlight_all=1

set nu

set encoding=utf-8
" set autoindent			" Respect indentation when starting a new line.
set expandtab			" expand tabs to spaces. essential in python.
set tabstop=4			" number of spaces tab is counted for.
set shiftwidth=4		" number of spaces to use for autoindent.

set backspace=2			" fix backspace behavior on most terminals.

set number              " display number of lines.

let g:gruvbox_bold = 1
let g:gruvbox_italic = 0
let g:gruvbox_transparent_bg = 0
let g:gruvbox_invert_tabline = 0
colorscheme delek " Change a colorscheme.

packloadall             " load all plugins.
silent! helptags ALL    " load help files for all plugins.

" Set up persistent undo across all files.
set undofile
if !isdirectory("$HOME/.vim/undodir")
	call mkdir("$HOME/.vim/undodir","p")
endif
set undodir="$HOME/.vim/undodir")

" set foldmethod=indent

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

set clipboard=unnamed  " Copy into system (*) register.

nnoremap <leader>g :execute grep -R '<cWORD>' .<cr>

vnoremap <leader>" :s/\%V\(.*\)\%V/"\1"/<CR>
" :s 代换模式
" \%V 表示匹配在visual 内的内容。
" \(.*\)  转义( 和 ) ,括号内是 .是正则中的匹配所有单字符除换行符外。
" * 是正则中的匹配大于等于可重复的在*号之前的字符.
" 意思是就:s 第一个参数也就是\%V\(.*\)\%V
" 表示匹配在visual选中的所有字符，替换成:s 的第二个参数
" :s 的第二个参数"\1" ,"就是字面意思，而\1表示第一个参数的匹配到的字符。

" test
vnoremap <leader>t :s/\%V.*\%V/<CR>

" change the input methods to english in insert mode


" nnoremap <leader>g :grep -R <cword> .<cr>
" nnoremap <leader>g :grep -R '<cWORD>' .<cr>
" nnoremap <leader>g :execute ":grep R '<cWORD>' ."<cr>
" nnoremap <leader>g :silent execute "grep -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>



" -------------------------------------------------------------------------------------------------
" coc.nvim default settings --- {{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


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

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" 新加的
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" h i_ctrl-g_u
" h i_ctrl-r_=


" inoremap <silent><expr> <C-i> <SID>Test()
function! s:Test()
    echom "hello test"
    return 1
endfunction


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion , not good bucasue <c-space> is change
" input and <c-@> very hard to type
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" \ may be is enter symbol,but it is need ?
let g:coc_explorer_global_presets = {
      \  '.vim': {
      \    'root-uri': '~/.vim',
      \  },
      \  'cocConfig': {
      \    'root-uri': '~/.config/coc',
      \  },
      \  'tab': {
      \    'position': 'tab',
      \    'quit-on-open': v:true,
      \  },
      \  'tab:$': {
      \    'position': 'tab:$',
      \    'quit-on-open': v:true,
      \  },
      \  'floating': {
      \    'position': 'floating',
      \    'open-action-strategy': 'sourceWindow',
      \  },
      \  'floatingTop': {
      \    'position': 'floating',
      \    'floating-position': 'center-top',
      \    'open-action-strategy': 'sourceWindow',
      \  },
      \  'floatingLeftside': {
      \    'position': 'floating',
      \    'floating-position': 'left-center',
      \    'floating-width': 50,
      \    'open-action-strategy': 'sourceWindow',
      \  },
      \  'floatingRightside': {
      \    'position': 'floating',
      \    'floating-position': 'right-center',
      \    'floating-width': 50,
      \    'open-action-strategy': 'sourceWindow',
      \  },
      \  'simplify': {
      \    'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
      \  },
      \  'buffer': {
      \    'sources': [{'name': 'buffer', 'expand': v:true}]
      \  }
      \}

" Use preset argument to open it
nmap <space>ed <Cmd>CocCommand explorer --preset .vim<CR>
nmap <space>f <Cmd>CocCommand explorer --preset floating<CR>
nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \  'colorscheme': 'wombat',
      \  'active': {
      \    'left': [ [ 'mode', 'paste' ],
      \      [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \  },
      \  'component_function': {
      \    'cocstatus': 'coc#status'
      \  },
      \}

" maps here! ############################################

" ###### Using nnoremap or nmap are in normal mode 
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" what is index(['vim','help'], &filetype) >= 0
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     " call CocAction('doHover')
"     call CocActionAsync('doHover')
"   endif
" endfunction

" Remap keys for terminal mode
" tnoremap <Esc> <C-\><C-n> it has incompatible with 'Buffers' of fzf command.


" Remap keys for tagbar
nmap <silent><F8> :TagbarToggle<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
" nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
" nmap <leader>as  <Plug>(coc-codeaction-source)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server the plugin
" I doesn't installed
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Use <c-space> to trigger completion. 不行ctrl + space 直接切换输入法
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" ##### Using vmap and vnoremap are visual and select mode.

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)

" pathogen.vim seting
" }}}

" for windows control --- {{{

" Fast split navigation with <Ctrl> + hjkl.
" vim built-in map
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>


" Change Ctrl+w follow by h -> Ctrl+h

" Use ; om additional to : to type commands.
" nnoremap ; :
" Use : nonrecursive map as :h
" nnoremap : :h 


" }}}

                    
