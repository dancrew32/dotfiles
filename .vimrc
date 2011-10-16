"Le Defaults
set nocompatible
set autoindent
set ignorecase
set smartcase
set hlsearch
"set incsearch
set mouse=v
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set history=700
set autoread
set shortmess=aI
set completeopt=longest,menuone
set cot+=menuone
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos
set switchbuf+=usetab,newtab
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set number
set clipboard=unnamed

"Handle backups
"set nobackup
"set nowritebackup

"Move swp files
set backupdir=/home/dan/tmp
set directory=/home/dan/tmp

"Filetypes
filetype plugin indent on
au BufNewFile,BufRead *.less set filetype=css

"Remap
imap jj <Esc><right>
imap kj <Esc>:w<CR>
imap KJ <Esc>:w<CR>
imap ({ ({<CR><CR>});<up><Tab>
imap {{ {<CR><CR>}<up><Tab>
imap }} {}<left>{}<left>
imap (( ()<left>
imap [[ []<left>
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>
noremap <c-s-k> ::call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <c-s-j> ddp
vmap <c-s-k> xkP`[V`]
vmap <c-s-j> xp`[V`]
vmap <F7> "+y
map <F2> :set paste<cr>
map <F3> :set nopaste<cr>
nmap Y _y$

imap como <? /*
imap clomo */ ?>
imap clog console.log();<left><left>
imap fb( fb();<left><left>
nmap zx :w<CR>

"Sessions
nmap SSA :wa<CR>:mksession! ~/sessions/
nmap SO :wa<CR>:so ~/sessions/

" Tab configuration
ca tn tabnew
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

"Conq terminal
map <F1> :ConqueTermSplit bash<cr>

"Recursively grep current directory for word under cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

"Omnicomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"PHP
let php_sql_query=1
let php_htmlInStrings=1
"let php_noShortTags=0
"let php_folding=1 
"JavaScript
"let javaScript_fold=1

"Sort CSS Alphabetically
nmap <F9> :g#\({\n\)\@<=#.,/}/sort<CR>

"NerdTree
map <F5> :NERDTreeToggle<cr>

"Tags
set tags=tags;~/www/rentjuice.local/tags

"Fuzzy Finder
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp|\.class|html/images/|assets/|scratch/$'
nnoremap <C-c> :<C-u>FufFile **/<CR> 

"calculator
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" reorder params
function! ReorderParams(params)
    let params = split(a:params, ',\s')
    let order = input(string(map(copy(params), 'v:key + 1 . ": " . v:val')))
    let @" = join(map(split(order, '[0-9]\zs'), 'params[str2nr(v:val) - 1]'), ', ')
    normal P
endfunction
nnoremap <F12> di(:call ReorderParams(@")<CR>

" Delete current buffer (and file)
function! DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  elseif ( &ft == 'help' )
    echohl Error
    echo "Cannot delete a help buffer!"
    echohl None
    return -1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction
"delete the current file
com! Rm call DeleteFile()
