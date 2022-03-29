" Nvim-R configuration
"
" Shortcut for R's assignment operator:
"     0 turns it off;
"     1 assigns underscore;
"     2 assigns two underscores
"     3 underscore will be replaced only if it is preceded by a space, followed by non-word char
let R_assign = 3
let R_nvim_wd = 1
let R_objbr_place = 'console,above'
let R_rconsole_width = 84
let R_hl_term = 0
" Use in an external emulator
" let R_external_term = 'foot -T R -h'
" let R_notmuxconf = 1
"
" let R_app = "radian"
" let R_cmd = "R"
" let R_args = []  " if you had set any
" let R_bracketed_paste = 1

" " Disable omnifunc
" let R_set_omnifunc = []

" Key bindings
let R_user_maps_only = 1

function! s:customNvimRMappings()
    " nmap <buffer> <localleader>xs <Plug>RStart
    " nmap <buffer> <localleader>xk :RKill <CR>
    " nmap <buffer> <localleader>xi :RStop <CR>
    " " map  <silent><buffer> <localleader>xr :call g:SendCmdToR(`"startup::restart()")<CR>
    " nmap <buffer> <localleader>xc <Plug>RClearAll
    " nmap <buffer> <localleader>xf <Plug>RClearConsole
    " map  <silent><buffer> <localleader>mm :call g:SendCmdToR("drake::r_make()")<CR>
    " map  <silent><buffer> <localleader>mc :call g:SendCmdToR("drake::clear()")<CR>
    " nmap <buffer> <localleader><localleader> <Plug>RDSendLine
    " vmap <buffer> <localleader><localleader> <Plug>RDSendSelection
    " nmap <buffer> <localleader>d <Plug>RDSendLine
    " vmap <buffer> <localleader>d <Plug>RDSendSelection
    " vmap <buffer> <localleader>D <Plug>RSendSelAndInsertOutput
    " nmap <buffer> <localleader>f <Plug>RDSendFunction
    " nmap <buffer> <localleader>b <Plug>RSendFile
    " nmap <buffer> <localleader>oo <Plug>ROpenLists
    " nmap <buffer> <localleader>od <Plug>RCloseLists
    " nmap <buffer> <localleader>ou <Plug>RUpdateObjBrowser
    " nmap <buffer> <localleader>hh <Plug>RHelp
    " " nmap <buffer> <localleader>hd <Plug>RObjectStr
    " nmap <silent><buffer> <localleader>hd :call RAction("dplyr::glimpse")<CR>
    " map  <silent><buffer> <localleader>ha :call g:SendCmdToR("print(ls.str(), max.lvl = Inf)")<CR>
    " nmap <buffer> <localleader>he <Plug>RObjectPr
    " "imap <buffer> <Leader>sr <Plug>RStart
    " "vmap <buffer> <Leader>sr <Plug>RStart
    " " Devtools
    " map  <silent><buffer> <localleader>pd :call g:SendCmdToR("devtools::document()")<CR>
    " map  <silent><buffer> <localleader>pv :call g:SendCmdToR("devtools::build_vignettes()")<CR>
    " map  <silent><buffer> <localleader>pT :call g:SendCmdToR("devtools::check()")<CR>
    " map  <silent><buffer> <localleader>pt :call g:SendCmdToR("devtools::test()")<CR>
    " map  <silent><buffer> <localleader>pl :call g:SendCmdToR("devtools::load_all()")<CR>
    "
    " " Renv
    " map  <silent><buffer> <localleader>ri :call g:SendCmdToR("renv::init()")<CR>
    " map  <silent><buffer> <localleader>re :call g:SendCmdToR("renv::install(c('languageserver', 'devtools'))")<CR>
    " map  <silent><buffer> <localleader>ru :call g:SendCmdToR("renv::update(prompt=F)")<CR>
    " map  <silent><buffer> <localleader>rs :call g:SendCmdToR("renv::snapshot(prompt=F)")<CR>
    " map  <silent><buffer> <localleader>rr :call g:SendCmdToR("renv::restore(prompt=F)")<CR>

    " Replace x$y$z by x[["y"]][["z"]]
    nmap <silent><buffer> <localleader>ss :s/\$\([a-zA-Z._0-9]*\)/[["\1"]]/ge<CR>
    vmap <silent><buffer> <localleader>ss :'<,'>s/\$\([a-zA-Z._0-9]*\)/[["\1"]]/ge<CR>

    " Iron.nvim keys
    map  <silent><buffer> <localleader>mm <Cmd>IronSend! drake::r_make() <CR>
    map  <silent><buffer> <localleader>mc <Cmd>IronSend! drake::clear() <CR>

    map  <silent><buffer> <localleader>pd <Cmd>IronSend! devtools::document() <CR>
    map  <silent><buffer> <localleader>pv <Cmd>IronSend! devtools::build_vignettes() <CR>
    map  <silent><buffer> <localleader>pT <Cmd>IronSend! devtools::check() <CR>
    map  <silent><buffer> <localleader>pt <Cmd>IronSend! devtools::test() <CR>
    map  <silent><buffer> <localleader>pl <Cmd>IronSend! devtools::load_all() <CR>

    " Renv
    map  <silent><buffer> <localleader>ri <Cmd>IronSend! renv::init() <CR>
    map  <silent><buffer> <localleader>re <Cmd>IronSend! renv::install(c('languageserver', 'devtools')) <CR>
    map  <silent><buffer> <localleader>ru <Cmd>IronSend! renv::update(prompt=F) <CR>
    map  <silent><buffer> <localleader>rs <Cmd>IronSend! renv::snapshot(prompt=F) <CR>
    map  <silent><buffer> <localleader>rr <Cmd>IronSend! renv::restore(prompt=F) <CR>

endfunction

augroup myNvimR
    au!
    autocmd filetype r call s:customNvimRMappings()
augroup end
