"Le Defaults
set nocompatible
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set history=700
set autoread
set shortmess=a

filetype plugin indent on

au BufNewFile,BufRead *.less set filetype=less

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

"Badass mappings
:imap kj <Esc>
:imap {( {<CR><CR>});<up><Tab>
:imap {{ {<CR><CR>}<up><Tab>
:imap (( ()<left>
:nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>
set completeopt=longest,menuone

"Sessions
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos
nmap SSA :wa<CR>:mksession! ~/sessions/
nmap SO :wa<CR>:so ~/sessions/

"Use the arrows to something usefull
map <right> :tabn<CR>
map <left> :tabp<CR>

" Tab configuration
ca tn tabnew
"ca th tabp
"ca tl tabn
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>

" recursively grep current directory for word under cursor
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" open quicklist items in new tabs (avoid duplicates)
set switchbuf+=usetab,newtab
