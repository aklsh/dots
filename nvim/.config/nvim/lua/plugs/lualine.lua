require("lualine").setup({
  options = {
    theme = "adwaita",
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "NvimTree" },
  },
  extensions = { "fugitive", "nvim-tree" },
})
