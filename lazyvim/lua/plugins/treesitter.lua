return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "twig",
      "html",
      -- andra språk du använder
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "twig", "html" },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
     },
   }
  },
}
