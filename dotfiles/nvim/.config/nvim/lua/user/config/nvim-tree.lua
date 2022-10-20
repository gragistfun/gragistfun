require("nvim-tree").setup({
  view = {
    side = 'right',
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      },
    }
  }
})
