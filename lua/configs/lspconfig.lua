local vim = vim
local capabilities = require("nvchad.configs.lspconfig").capabilities
local map = vim.keymap.set

-- local java = require "java"
require("neoconf").setup {
  -- override any of the default settings here
}

local lspconfig = require "lspconfig"

local telescope = require "telescope.builtin"

local signs = {
  { name = "DiagnosticSignError", text = "●" },
  { name = "DiagnosticSignWarn", text = "●" },
  { name = "DiagnosticSignHint", text = "●" },
  { name = "DiagnosticSignInfo", text = "●" },
}

local on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "gd", telescope.lsp_definitions, opts "Lsp Go to definition")
  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "gi", telescope.lsp_implementations, opts "Lsp Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Lsp Show signature help")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Lsp Go to type definition")
  map("n", "<leader>rn", vim.lsp.buf.rename, opts "Lsp Renamer")
  -- map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Lsp Code action")
  map("n", "gr", telescope.lsp_references, opts "Lsp Show references")

  -- setup signature popup
  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false,
  signs = { active = signs },
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  numhl = {},
  linehl = {},
}

vim.diagnostic.config(config)

local servers = {
  "html",
  "cssls",
  "lua_ls",
  "ruff",
  "jdtls",
  "gopls",
  "bashls",
  "terraformls",
  "sqlls",
  "dockerls",
  "docker_compose_language_service",
  "buf_ls",
  "pbls",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = {
        enable = true,
      },
    },
  },
}

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}

lspconfig.pyright.setup {
  before_init = function(_, config)
    config.settings.python.analysis.stubPath = vim.fs.joinpath(vim.fn.stdpath "data", "lazy", "python-type-stubs")
  end,
}
lspconfig.ts_ls.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
lspconfig.taplo.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
