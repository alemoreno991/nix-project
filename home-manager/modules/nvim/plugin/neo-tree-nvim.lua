require('neo-tree').setup({
  window = {
    mappings = {
      ["\\"] = "close_window",
      ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
    },
  },
})

vim.keymap.set('n', '\\', ':Neotree reveal<CR>', { desc = 'Neotree reveal', silent = true })
