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
    " Replace x$y$z by x[["y"]][["z"]]
    nmap <silent><buffer> <localleader>ss :s/\$\([a-zA-Z._0-9]*\)/[["\1"]]/ge<CR>
    vmap <silent><buffer> <localleader>ss :'<,'>s/\$\([a-zA-Z._0-9]*\)/[["\1"]]/ge<CR>

    " Iron.nvim keys
    map  <silent><buffer> <localleader>mm <Cmd>lua require("iron.core").send("r", {[[targets::tar_make_future()]]})<CR>
    map  <silent><buffer> <localleader>mc <Cmd>lua require("iron.core").send("r", {[[targets::tar_destroy()]]})<CR>

    map  <silent><buffer> <localleader>pd <Cmd>lua require("iron.core").send("r", {[[devtools::document()]]})<CR>
    map  <silent><buffer> <localleader>pv <Cmd>lua require("iron.core").send("r", {[[devtools::build_vignettes()]]})<CR>
    map  <silent><buffer> <localleader>pT <Cmd>lua require("iron.core").send("r", {[[devtools::check()]]})<CR>
    map  <silent><buffer> <localleader>pt <Cmd>lua require("iron.core").send("r", {[[devtools::test()]]})<CR>
    map  <silent><buffer> <localleader>pl <Cmd>lua require("iron.core").send("r", {[[devtools::load_all()]]})<CR>

    " Renv
    map  <silent><buffer> <localleader>ri <Cmd>lua require("iron.core").send("r", {[[renv::init(bare = TRUE)]]})<CR>
    map  <silent><buffer> <localleader>re <Cmd>lua require("iron.core").send("r", {[[renv::install(c('languageserver', 'devtools'))]]})<CR>
    map  <silent><buffer> <localleader>ru <Cmd>lua require("iron.core").send("r", {[[renv::update(prompt=F)]]})<CR>
    map  <silent><buffer> <localleader>rs <Cmd>lua require("iron.core").send("r", {[[renv::snapshot(prompt=F)]]})<CR>
    map  <silent><buffer> <localleader>rr <Cmd>lua require("iron.core").send("r", {[[renv::restore(prompt=F)]]})<CR>

endfunction

augroup myNvimR
    au!
    autocmd filetype r call s:customNvimRMappings()
augroup end
