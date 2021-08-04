local g = vim.g

vim.cmd('hi clear signcolumn')
g.gitgutter_sign_modified                  = '±'
g.gitgutter_sign_removed                   = '-'
g.gitgutter_sign_removed_first_line        = '^'
g.gitgutter_sign_modified_removed          = '#'
