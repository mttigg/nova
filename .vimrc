vim9script

set laststatus=2
set showtabline=2
set guioptions-=e
set mouse=a
set directory^=$HOME/.vim/swap//
set backupcopy=yes
set cmdheight=2
set relativenumber
set wildoptions=pum
set updatetime=50
set hidden
set nowrap
set number
set showtabline=2
set undodir=~/.vim/undo
set undofile
set background=dark
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
g:prettier#autoformat = 1
g:prettier#autoformat_require_pragma = 0
g:mapleader = ","
filetype indent on
var vimspector_enable_mappings = 'HUMAN'
nmap <Leader>k <Plug>VimspectorBalloonEval

nnoremap <C-P>aa :argadd %<CR>
nnoremap <C-P>ad :argdelete %<CR>
nnoremap <C-P>f :find ./src/**/*
nnoremap <C-P>g :grep -r  ./src/**<Left><Left><Left><Left><Left><Left><Left><Left><Left>

if exists('+termguicolors')
  &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


call plug#begin('~/.vim/plugged')
  # Basics
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-abolish'
 Plug 'tpope/vim-dispatch'
 Plug 'tpope/vim-eunuch'
 Plug 'tpope/vim-dadbod'
 Plug 'tpope/vim-flagship'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-rhubarb'
 Plug 'tpope/vim-sensible'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-unimpaired'
 Plug 'tpope/vim-vinegar'
 Plug 'tpope/vim-apathy'
 Plug 'tpope/vim-obsession'
 Plug 'kristijanhusak/vim-dadbod-completion'
 Plug 'kristijanhusak/vim-dadbod-ui'
 Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }

  # Debug
  # Plug 'puremourning/vimspector'

  # Color
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }

  # Diagnostics
  # Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

# colorscheme catppuccin_mocha
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

#
# Lsp Config
#
packadd lsp
# Goto code navigation.
nmap <silent> [< :LspDiagFirst<CR>
nmap <silent> [<Leader> :LspDiagPrev<CR>
nmap <silent> ]<Leader> :LspDiagNext<CR>
nmap <silent> <Leader>d :LspGotoDefinition<CR>zt
nmap <silent> <Leader>t :LspGotoTypeDef<CR>zt
nmap <silent> <Leader>i :LspGotoImpl<CR>zt
nmap <silent> <Leader>r :LspShowReferences<CR>
nmap <silent> <Leader>o :LspOutline<CR>
nmap <silent> <Leader>h :LspHover<CR>:LspDiagCurrent<CR>
nmap <silent> <Leader>D :LspPeekDefinition<CR>
nmap <silent> <Leader>T :LspPeekTypeDef<CR>
nmap <silent> <Leader>I :LspPeekImpl<CR>
nmap <silent> <Leader>R :LspPeekReferences<CR>

# Custom Functions
def RunNpmTest(): void
  var filename: string = expand('%')
  var cmd: list<string> = ['npm', 'run', 'test', filename]

  var job: any = job_start(cmd, {
    'out_io': 'buffer',
    'out_name': 'npm-test-output',
    'err_io': 'buffer',
    'err_name': 'npm-test-error',
    'exit_cb': function('JobExit')
  })
  g:firstWord = '[RUNNING...]'
  redrawstatus!
enddef


hi def Success ctermfg=green guifg=green
hi def Error ctermfg=red guifg=red
hi def Fail ctermfg=magenta guifg=magenta
hi def Pass ctermfg=blue guifg=blue
hi def TestSuite ctermfg=yellow guifg=yellow
hi def TestName ctermfg=cyan guifg=cyan
hi def Arrow ctermfg=white guifg=white
hi def Expected ctermfg=darkyellow guifg=darkyellow
hi def Received ctermfg=darkcyan guifg=darkcyan
prop_type_add('Success', {'highlight': 'Success'})
prop_type_add('Error', {'highlight': 'Error'})
prop_type_add('Fail', {'highlight': 'Fail'})
prop_type_add('Pass', {'highlight': 'Pass'})
prop_type_add('TestSuite', {'highlight': 'TestSuite'})
prop_type_add('TestName', {'highlight': 'TestName'})
prop_type_add('Arrow', {'highlight': 'Arrow'})
prop_type_add('Expected', {'highlight': 'Expected'})
prop_type_add('Received', {'highlight': 'Received'})

def SetSyntaxHighlighting(bufnr: number): void
  var lines: list<string> = getline(1, '$')

  for lnum in range(1, len(lines))
    var line: string = lines[lnum - 1]
    var col: number

    col = line->stridx('✓')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'Success', 'length': 1, 'bufnr': bufnr})
    endif

    col = line->stridx('✕')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'Error', 'length': 1, 'bufnr': bufnr})
    endif

    col = line->stridx('FAIL')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'Fail', 'length': 4, 'bufnr': bufnr})
    endif

    col = line->stridx('PASS')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'Pass', 'length': 4, 'bufnr': bufnr})
    endif

    col = line->stridx('Test Suites:')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'TestSuite', 'length': 12, 'bufnr': bufnr})
    endif

    col = line->stridx('Tests:')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'TestSuite', 'length': 6, 'bufnr': bufnr})
    endif

    col = line->stridx('Time:')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'TestSuite', 'length': 5, 'bufnr': bufnr})
    endif

    col = line->stridx('●')
    if col != -1
      # Highlight from the bullet point to the end of the line as a test name
      prop_add(lnum, col + 1, {'type': 'TestName', 'length': line->len() - col, 'bufnr': bufnr})
    endif

    col = line->stridx('>')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'Arrow', 'length': 1, 'bufnr': bufnr})
    endif

    col = line->stridx('Expected:')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'Expected', 'length': 8, 'bufnr': bufnr})
    endif

    col = line->stridx('Received:')
    if col != -1
      prop_add(lnum, col + 1, {'type': 'Received', 'length': 8, 'bufnr': bufnr})
    endif
  endfor
enddef

def TestResult(): void
  var bufnr: number = bufnr('npm-test-error', 1)
  if bufwinnr(bufnr) == -1
    execute('new npm-test-error')
  else
    execute(bufwinnr(bufnr) .. 'wincmd w')
  endif

  setbufvar(bufnr, '&buftype', 'nofile')
  setbufvar(bufnr, '&bufhidden', 'wipe')
  execute('setlocal noswapfile')
  SetSyntaxHighlighting(bufnr)
enddef

def JobExit(job: any, status: number): void
  echo 'Job Done. Exit Code: ' .. status
  var bufnr: number = bufnr('npm-test-error', 1)
  var second_line = getbufline(bufnr, 2)[0]
  echo second_line
  g:firstWord = "[" .. split(second_line)[0] .. "]"
  redrawstatus!
enddef

com TestResult TestResult()
com RunNpmTest RunNpmTest()
nnoremap <C-P>t :RunNpmTest<CR>
nnoremap <C-P>T :TestResult<CR>

g:firstWord = ''

autocmd User Flags call Hoist("global", -10, "%{g:firstWord}")
autocmd User Flags call Hoist("global", "%{&ignorecase ? '[IC]' : ''}")

# Options
g:db_ui_table_helpers = {
   'mongodb+srv': {
     'List': '{table}.find()',
     'One': '{table}.findOne()',
     'Organization': '{table}.find({ organizationId: ObjectId("") })',
     'Count': '{table}.count()'
   }
}
g:lspServers = [
    {
       'filetype': ['javascript', 'typescript', 'typescriptreact'],
       'path': '/home/ec2-user/.nvm/versions/node/v16.15.0/bin/typescript-language-server',
       'args': ['--stdio']
    }
]
call LspAddServer(g:lspServers)
