-- 1. Bootstrap lazy.nvim, LazyVim och dina plugins
require("config.lazy")

-- 2. Garantera att htmlError får rätt färg (blå, inte röd)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[highlight htmlTagName guifg=#8be9fd ctermfg=81]]
    vim.cmd [[highlight htmlTag guifg=#Affffff ctermfg=81]]
    vim.cmd [[highlight htmlEndTag guifg=#ffffff ctermfg=81]]
    vim.cmd [[highlight htmlError guifg=#ffffff ctermfg=81]]

    vim.cmd [[highlight htmlArg guifg=#f1fa8c ctermfg=228]]
    vim.cmd [[highlight htmlString guifg=#50fa7b ctermfg=77]]
    vim.cmd [[highlight htmlValue guifg=#50fa7b ctermfg=77]]
    vim.cmd [[highlight htmlClass guifg=#50fa7b ctermfg=77]]

--  Twig
    vim.cmd [[highlight twigVariable guifg=#ffffff ctermfg=141]]
    vim.cmd [[highlight twigBlockDelim guifg=#bd93f9 ctermfg=141]]
    vim.cmd [[highlight twigVarDelim guifg=#ffb86c ctermfg=215]]
    vim.cmd [[highlight twigOperator guifg=#ffb86c ctermfg=215]]
    vim.cmd [[highlight twigString guifg=#f1fa8c ctermfg=228]]
    vim.cmd [[highlight twigNumber guifg=#bd93f9 ctermfg=141]]
    vim.cmd [[highlight twigComment guifg=#6272a4 ctermfg=103]]
    -- Standard text till Dracula vit
    vim.cmd [[highlight Normal guifg=#f8f8f2 ctermfg=15]]
  end,
})

-- 4. Rätt filetype och syntax för Twig + HTML (även vid fuzzy search)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.twig", "*.html.twig" },
  callback = function()
    vim.bo.filetype = "twig"
    -- Inkludera HTML-syntax i Twig-filer
    vim.cmd("syntax include @HTML syntax/html.vim")
    vim.cmd("syntax region htmlTag matchgroup=htmlTag start=+<+ end=+>+ contains=@HTML")
  end,
})
