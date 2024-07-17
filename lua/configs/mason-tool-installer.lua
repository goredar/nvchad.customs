local installer = require "mason-tool-installer"

installer.setup {
  ensure_installed = {
    -- Lua
    "lua-language-server",
    "stylua",

    -- Webdev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint_d",

    -- c/cpp
    "clangd",

    -- Java
    "jdtls",
    "java-debug-adapter",
    "java-test",

    -- Bash
    "bash-language-server",
    "shellcheck",
    "shfmt",

    -- Python
    "pyright",
    "mypy",
    "black",
    "ruff",
    "buf_ls",

    -- Goalng
    "gopls",
    "golangci-lint",
    "gofumpt",
    "golines",
    "gotests",
    "impl",
    "revive",
    "staticcheck",

    -- Rust
    "rust-analyzer",
    "taplo",

    -- JSON/YAML
    "json-lsp",
    "yaml-language-server",

    -- Protobuf
    "pbls",

    -- Terraform/HCL
    "terraform-ls",
    "tflint",
    "tfsec",

    -- SQL
    "sqlls",
    "sql-formatter",
    "sqlfluff",

    -- Other
    "codespell",
    "sonarlint-language-server",
    "editorconfig-checker",
    "misspell",
    "cspell",
    "vale",
    "vale-ls",
    "write-good",
    "markdownlint",

    -- Docker
    "dockerls",
    "docker-compose-language-service",
    "hadolint",

    "bash-language-server",
    "lua-language-server",
    "vim-language-server",
    "gopls",
    "stylua",
    "sqlfmt",
    "editorconfig-checker",
    "gofumpt",
    "golines",
    "gotests",
    "goimports",
    "impl",
    "jq",
    "revive",
    "staticcheck",
    "vint",
    "yamllint",
    "yamlfmt",
    "yamlls",
    "hadolint",
    "dockerls",
    "diagnosticls",
    "terraformls",
    "delve",
  },
  auto_update = true,
}
