-- More arguments can be found in the stylua documentation
local luaConfig = function()
  return {
    exe = 'stylua',
    args = {
      '--column-width 80',
      '--indent-type Spaces',
      '--indent-width 2',
      '--quote-style ForceSingle',
    },
    stdin = false,
  }
end

require('formatter').setup({
  filetype = {
    lua = { luaConfig },
  },
})

-- This will run the FormatWrite command for every filetype
-- If there's not any formatter configured for the current
-- filetype nothing will happen
vim.api.nvim_exec(
  [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
  ]],
  true
)

return {}
