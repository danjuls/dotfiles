return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                phpVersion = "8.3",
              },
            },
          },
        },
      },
    },
  },
}
