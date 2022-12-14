local protocol = vim.lsp.protocol

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gS', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap(
    'n',
    '<space>wa',
    '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '<space>wr',
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '<space>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '<space>D',
    '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    opts
  )
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(
    'n',
    '<space>ca',
    '<cmd>lua vim.lsp.buf.code_action()<CR>',
    opts
  )
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(
    'n',
    '<space>e',
    '<cmd>lua vim.diagnostic.open_float(0, { scope = "line" })<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '<S-C-j>',
    '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
    opts
  )
  buf_set_keymap(
    'n',
    '<space>q',
    '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
    opts
  )
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  protocol.CompletionItemKind = {
    '???', -- Text
    '???', -- Method
    '???', -- Function
    '???', -- Constructor
    '???', -- Field
    '???', -- Variable
    '???', -- Class
    '???', -- Interface
    '???', -- Module
    '???', -- Property
    '???', -- Unit
    '???', -- Value
    '???', -- Enum
    '???', -- Keyword
    '???', -- Snippet
    '???', -- Color
    '???', -- File
    '???', -- Reference
    '???', -- Folder
    '???', -- EnumMember
    '???', -- Constant
    '???', -- Struct
    '???', -- Event
    '???', -- Operator
    '???', -- TypeParameter
  }
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = protocol.make_client_capabilities()
require('cmp_nvim_lsp').update_capabilities(capabilities)

-- require configurations
-- frontend (mainly TS/JS)
require('custom.plugins.lspconfig.servers').attach(on_attach)
-- diagnostics
require('custom.plugins.lspconfig.diagnostics').setup()

return {}
Footer
