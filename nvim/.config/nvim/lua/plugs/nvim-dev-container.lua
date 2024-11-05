require("devcontainer").setup{
  attach_mounts = {
    neovim_config = {
      enabled = true,
      options = { "readonly" }
    },
    neovim_data = {
      enabled = false,
      options = {}
    },
    -- Only useful if using neovim 0.8.0+
    neovim_state = {
      enabled = true,
      options = {}
    },
  },
}
