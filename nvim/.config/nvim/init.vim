let mapleader=" "


call plug#begin('~/local/share/nvim/plugged')

"Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/goyo.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'terryma/vim-multiple-cursors'
" Working with tags
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
" Nerd Tree plugns
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
" Syntax highlighting
Plug 'yuezk/vim-js'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

" airline colorscheme for codedark theme
let g:airline_theme = 'codedark'

"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Basic settings
syntax on
set encoding=utf-8
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set number relativenumber
set termguicolors
"colorscheme gruvbox
colorscheme codedark
set mouse=a

" New  tab
" nmap <C-n> :tabnew<CR>

" Autocompletion
set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

" Use system clipboard
set clipboard+=unnamedplus

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ------NERDTree Settings------
nmap <C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
autocmd VimEnter * NERDTree

" Close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }


let g:NERDTreeIgnore = ['^node_modules$']

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction


" ------Vim Auto Closetag------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


" ------COC SETTINGS------
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-angular',
  \ 'coc-texlab'
  \ ]

" From Coc Readme
set updatetime=300

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <rn> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ------Standard Bindings------
" Basic file system commands
nnoremap <C-t> :!touch<Space>
nnoremap <C-d> :!mkdir<Space>
nnoremap <C-m> :!mv<Space>%<Space>

" Enable Disable colourizing
map <leader>d :ColorizerAttachToBuffer<CR>
map <leader>D :ColorizerDetachFromBuffer<CR>

" Enable disable Goyo
map <leader>g :Goyo<CR>
map <leader>G :Goyo!<CR>

" Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Enable spell checking, o for othography
map <leader>s :setlocal spell! spelllang=en_au<CR>

" Enable Disable Auto Indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Shell check
map <leader>P :!clear && shellcheck %<CR>

" Compile and open output
map <leader>r :w! \| !comp <c-r>%<CR><CR>
map <leader>o :!opout <c-r>%<CR><CR>

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut split opening
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Alias replace all to S
nnoremap S :%s//g<Left><Left>

" Alias write to W
nnoremap W :w<CR>

" Alias write and quit to Q
nnoremap Q :wq<CR>

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Fix tex file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Guide navigation
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" general insert commands
inoremap ;g <++>

" shell
map <leader>b i#!/bin/sh<CR><CR>
autocmd FileType sh inoremap ,f ()<Space>{<CR><Tab><++><CR>}<CR><CR><++><Esc>?()<CR>
autocmd FileType sh inoremap ,i if<Space>[<Space>];<Space>then<CR><++><CR>fi<CR><CR><++><Esc>?];<CR>hi<Space>
autocmd FileType sh inoremap ,ei elif<Space>[<Space>];<Space>then<CR><++><CR><Esc>?];<CR>hi<Space>
autocmd FileType sh inoremap ,sw case<Space>""<Space>in<CR><++>)<Space><++><Space>;;<CR><++><CR>esac<CR><CR><++><Esc>?"<CR>i
autocmd FileType sh inoremap ,ca )<Space><++><Space>;;<CR><++><Esc>?)<CR>

" html
autocmd FileType html noremap <leader>d i<!DOCTYPE html><CR><html><CR><head><CR><meta charset="UTF-8"><CR><title><++></title><CR></head><CR><body><CR><++><CR></body><CR></html>
autocmd FileType html inoremap ,1 <h1></h1><CR><CR><++><Esc>?</h1<CR>i
autocmd FileType html inoremap ,2 <h2></h2><CR><CR><++><Esc>?</h2<CR>i
autocmd FileType html inoremap ,3 <h3></h3><CR><CR><++><Esc>?</h3<CR>i
autocmd FileType html inoremap ,4 <h4></h4><CR><CR><++><Esc>?</h4<CR>i
autocmd FileType html inoremap ,5 <h5></h5><CR><CR><++><Esc>?</h4<CR>i
autocmd FileType html inoremap ,6 <h6></h6><CR><CR><++><Esc>?</h4<CR>i
autocmd FileType html inoremap ,d <div><CR></div><CR><CR><++><Esc>?</div<CR><S-o>
autocmd FileType html inoremap ,ar <article><CR></article><CR><CR><++><Esc>?</arti<CR><S-o>
autocmd FileType html inoremap ,as <aside><CR></aside><CR><CR><++><Esc>?</asid<CR><S-o>
autocmd FileType html inoremap ,fic <figcaption><CR></figcaption><CR><CR><++><Esc>?</figcap<CR><S-o>
autocmd FileType html inoremap ,fi <figure><CR></figure><CR><CR><++><Esc>?</figure<CR><S-o>
autocmd FileType html inoremap ,he <header><CR></header><CR><CR><++><Esc>?</header<CR><S-o>
autocmd FileType html inoremap ,f <footer><CR></footer><CR><CR><++><Esc>?</footer<CR><S-o>
autocmd FileType html inoremap ,fo <form action=""><CR><++><CR></form><CR><CR><Esc>?"<CR>i
autocmd FileType html inoremap ,in <input type="" name="<++>" placeholder="<++>"/><CR><++><Esc>?""<CR>li
autocmd FileType html inoremap ,te <textarea rows="" col="<++>" placeholder="<++>"/><++></textarea><CR><++><Esc>?s=""<CR>llli
autocmd FileType html inoremap ,bu <button type=""><++></button><CR><++><Esc>?"<CR>i
autocmd FileType html inoremap ,la <label for=""><++></label><CR><++><Esc>?"<CR>i
autocmd FileType html inoremap ,ma <main><CR></main><CR><CR><++><Esc>?</main<CR><S-o>
autocmd FileType html inoremap ,mr <mark><CR></mark><CR><CR><++><Esc>?</mark<CR><S-o>
autocmd FileType html inoremap ,n <nav><CR></nav><CR><CR><++><Esc>?</nav<CR><S-o>
autocmd FileType html inoremap ,se <section><CR></section><CR><CR><++><Esc>?</section<CR><S-o>
autocmd FileType html inoremap ,su <summary><CR><summary><CR><CR><++><Esc>?</summary?<CR><S-o>
autocmd FileType html inoremap ,p <p><CR></p><CR><CR><++><Esc>?</p><CR><S-o>
autocmd FileType html inoremap ,b <b></b><Space><++><Esc>?</b><CR>i
autocmd FileType html inoremap ,a <a href=""><++></a><Space><++><Esc>?"<CR>i
autocmd FileType html inoremap ,br <CR></br><CR>
autocmd FileType html inoremap ,em <em><em><Space><++><Esc>?</p><CR>i
autocmd FileType html inoremap ,im <img src="" alt="<++>"><CR><CR><++><Esc>?""<CR>li
autocmd FileType html inoremap ,ol <ol><CR><li></li><CR><++><CR></ol><CR><CR><++><Esc>?</li><CR>i
autocmd FileType html inoremap ,ul <ul><CR><li></li><CR><++><CR></ul><CR><CR><++><Esc>?</li><CR>i
autocmd FileType html inoremap ,li <li></li><CR><++><Esc>?</li><CR>i
autocmd FileType html inoremap ,ta <table><CR><thead><CR><tr><CR><th></th><CR><++><CR></tr><CR></thead><CR><tbody><CR><tr><CR><td><++></td><CR><++><CR></tr><CR></tbody><CR><tfoot><CR><tr><CR><td><++></td><CR><++><CR></tfoot><CR></table><Esc>?</th><CR>i
autocmd FileType html inoremap ,th <th></th><CR><++><Esc>?</th><CR>i
autocmd FileType html inoremap ,td <td></td><CR><++><Esc>?</td><CR>i
autocmd FileType html inoremap ,tr <tr><CR></tr><CR><CR><++><Esc>?</tr><CR>i

" markdown
autocmd FileType markdown noremap <leader>r i---<CR>title:<Space><++><CR>author:<Space>"Brodie Robertson"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR>header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}<CR><BS>---<CR><CR>
autocmd FileType markdown inoremap ,i ![]("<++>")<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,a []("<++>")<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,1 #<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,2 ##<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,3 ###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,4 ####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,5 #####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,u +<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,o 1.<Space><CR><++><Esc>1k<S-a>

" latex
autocmd FileType tex,latex noremap <leader>d :w<CR>:!texify<Space>-cp<Space>%<CR>
autocmd FileType tex,latex inoremap ,c \{<++>}<CR><++><Esc>?{<CR>i
autocmd FileType tex,latex inoremap ,dc \documentclass{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,up \usepackage{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,bd \begin{document}<CR><CR><CR><CR>\end{document}<Esc>kki
autocmd FileType tex,latex inoremap ,be \begin{}<CR><CR><CR><CR>\end{<++>}<Esc>?n{<CR>lli
autocmd FileType tex,latex inoremap ,ti \title{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,a \author{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,mt \maketitle<CR><CR>
autocmd FileType tex,latex inoremap ,s \section{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,ss \subsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,sss \subsubsection{}<CR><CR><++><Esc>?}<CR>i
autocmd FileType tex,latex inoremap ,rc \renewcommand{}{<++>}<CR><CR><++><Esc>?}{<CR>i
autocmd FileType tex,latex inoremap ,tf \titleformat{}{<++>}{<++>}{<++>}{<++>}<CR><CR><++><Esc>?{}<CR>li
autocmd FileType tex,latex inoremap ,lt {\LaTeX}<Space>
autocmd FileType tex,latex inoremap ,b \bfseries
autocmd FileType tex,latex inoremap ,t \tiny
autocmd FileType tex,latex inoremap ,sc \scriptsize
autocmd FileType tex,latex inoremap ,fn \footnotesize
autocmd FileType tex,latex inoremap ,sm \small
autocmd FileType tex,latex inoremap ,l \large
autocmd FileType tex,latex inoremap ,h \huge
