vim.cmd [[
    augroup TS_Highlight
        autocmd!
        autocmd FileType * TSBufEnable highlight
    augroup END

    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'config.jdtls'.setup_jdtls()
    augroup end

 ]]

