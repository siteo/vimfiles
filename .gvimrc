"""" Windows setting
if has('win32') || has('win64')
    if has('nvim')
        Guifont! Migu 1M:h12
    else
        source $VIMRUNTIME/menu.vim
        source $VIMRUNTIME/delmenu.vim
        " autocmd GUIEnter * set transparency=230
        set noundofile
        set guifont=Migu_1M:h12
    endif
    set langmenu=ja_jp.utf-8

    colorscheme iceberg
    set lines=50
    set columns=140
    set ambiwidth=double
endif

"""" Mac setting
if has('mac')
    set number
    set lines=40
    set columns=120
    colorscheme iceberg
    set guifont=Migu\ 1M\ Regular:h12
    set t_Co=256
    syntax on
endif

if has('persistent_undo')
    set undodir=~/undo
    set undofile
endif

"" indent guides
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd    guibg=#0000a5  ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven   guibg=#0041a5 ctermbg=140

"" neocomplete
hi Pmenu guibg=#000080
hi PmenuSel guibg=#0087ff
hi PMenuSbar guibg=#000080

"" vim airline
let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = airline#section#create(['branch'])
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
      \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
      \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
      \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0

"" other setting
hi clear CursorLine
