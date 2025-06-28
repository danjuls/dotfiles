return {
  -- Workaround för att alltid sätta filetype till 'twig' på .html.twig-filer
  {
    "nelsyeung/twig.vim",
    ft = "twig",
    config = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.twig", "*.html.twig" },
        callback = function()
          vim.bo.filetype = "twig"
	  vim.cmd("syntax include @HTML syntax/html.vim")
    	  vim.cmd("syntax region htmlTag matchgroup=htmlTag start=+<+ end=+>+ contains=@HTML")
        end,
      })
    end,
  },
}
