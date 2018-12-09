let g:vimtex_compiler_latexmk = {}
let g:vimtex_compiler_latexmk['background'] = 1
let g:vimtex_compiler_latexmk['build_dir'] = ''
let g:vimtex_compiler_latexmk['callback'] = 1
let g:vimtex_compiler_latexmk['continuous'] = 1
let g:vimtex_compiler_latexmk['options']
      \ = ['-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',]

if has('win32') || has('win64')
  set isfname-={,}
  let g:vimtex_view_general_viewer = 'PDF-Viewer'
  let g:vimtex_view_general_options
        \ = '-reuse-instance -forward-search @tex @line @pdf'
  let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif
