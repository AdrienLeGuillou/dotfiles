function! s:customLuaDevMappings()
    nmap <buffer> <localleader>xs :Luadev <CR>
    nmap <buffer> <localleader><localleader> <Plug>(Luadev-RunLine)
    vmap <buffer> <localleader><localleader> <Plug>(Luadev-Run)
    vmap <buffer> <localleader>d <Plug>(Luadev-Run)
    nmap <buffer> <localleader>he <Plug>(Luadev-RunWord)
endfunction

augroup myLuaDev
    au!
    autocmd filetype lua call s:customLuaDevMappings()
augroup end
