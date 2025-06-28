return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Ingen require('nord').setup()
      vim.cmd([[colorscheme nord]])
    end,
  },
}
