local g = vim.g

g.startify_change_to_vcs_root = 1
g.startify_files_number = 5

vim.api.nvim_exec([===[
let g:startify_lists = [ { 'type': 'dir', 'header': [ 'Files '. getcwd() ] }, { 'type': 'sessions',  'header': [ 'Sessions' ]       }, { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      }, { 'type': 'commands',  'header': [ 'Commands' ]       }, ]
]===], true)

vim.api.nvim_exec([===[
let g:startify_commands = [{ 'up': [ 'Update/Sync Plugins', ':PackerSync' ] }, { 'ch': [ ':checkhealth', ':checkhealth' ] }]
]===],
true)

vim.api.nvim_exec([===[
let g:startify_bookmarks = [ { 'd': '~/dots' }, { 's': '~/Personal/startpage' }, { 'w': '~/Personal/website' } ]
]===],
true)

g.startify_custom_header = {
'',
'   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
'   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
'   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
'   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
'   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
'   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
'',
'',
 }

vim.cmd([[
function! StartifyEntryFormat()
	return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])
