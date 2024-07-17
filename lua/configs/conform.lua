local conform = require "conform"

local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    -- yaml = { "prettier" },
    -- toml = { "taplo" },
    graphql = { "prettier" },
    proto = { "buf" },

    -- python = { "isort", "black" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    -- go = { "goimports", "golines", "gofumpt" },
    go = { "goimports", "gofumpt" },

    sh = { "shfmt", "shellcheck" },
    sql = { "sql_formatter" },
    -- sql = { "sqlfluff" },

    terraform = { "terraform_fmt" },
    -- hcl = { "terragrunt_fmt" },

    -- markdown = { "deno_fmt", "prettier" },
    markdown = { "write_good" },

    ["*"] = { "trim_newlines", "trim_newlines" },
    -- ["*"] = { "codespell", "trim_newlines", "trim_newlines" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
}

conform.formatters.sqlfluff = {
  args = { "fix", "--force", "--dialect=ansi", "-" },
}
conform.formatters.sql_formatter = {
  prepend_args = { "--config", "/Users/goredar/.config/nvim/lua/custom/configs/slq_formatter.json" },
}
conform.formatters.goimports = {
  prepend_args = { "-local", "gitlab.pandadoc.com" },
}
conform.formatters.hclfmt = {
  command = "hclfmt",
}
conform.formatters.terragrunt_fmt = {
  command = "terragrunt",
  args = { "fmt", "-" },
}

conform.formatters.taplo = {
  args = { "format", "-o", "indent_string=    ", "-" },
}

require("conform").setup(options)
