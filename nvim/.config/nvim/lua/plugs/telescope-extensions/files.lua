-- Smartly opens either git_files or find_files, depending on whether the working directory is
-- contained in a Git repo.

local builtin = require('telescope.builtin')
local M = {}

function M.find_project_files()
  local ok = pcall(builtin.git_files)

  if not ok then
    builtin.find_files()
  end
end

return M
