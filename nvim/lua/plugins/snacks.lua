local in_container = vim.fn.filereadable("/.dockerenv") == 1

return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        trash = false,
      },
    },
  },
}
