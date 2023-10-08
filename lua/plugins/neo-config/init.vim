let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'args': ['-q', '-'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_python = ['black']