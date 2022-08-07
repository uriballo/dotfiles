return {
  ensure_installed + {
    'lua',
    -- 'latex', → already done by VimTex
    'markdown',
  },
  highlight = { enabled = true },
  incremental_selection = { enabled = true },
  textobjects = { enabled = true },
}

