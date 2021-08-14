local g = vim.g
local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

map('n', '<Leader><Space>', ':Files<CR>', options)
map('n', '<Leader>g', ':GFiles?<CR>', options)
map('n', '<Leader>c', ':Commits<CR>', options)
map('n', '<Leader>bc', ':BCommits<CR>', options)
map('n', '<Leader>f', ':Rg<Space>', options)

g.fzf_commits_log_options = "--color=always --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(bold white)%s%C(reset) %C(white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"

vim.cmd('autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>')
