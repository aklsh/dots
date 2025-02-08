require("lualine").setup({
  options = {
    theme = 'auto',
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "NvimTree" },
  },
  extensions = { "fugitive", "nvim-tree" },
})
