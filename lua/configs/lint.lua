local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  svelte = { "eslint_d" },

  markdown = { "vale", "markdownlint" },

  -- python = { "mypy", "pylint", "flake8", "ruff", "bandit" },
  python = { "mypy", "ruff" },
  go = { "golangcilint", "revive" },

  terraform = { "tflint", "tfsec" },
  hcl = {},

  dockerfile = { "hadolint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
    require("lint").try_lint { "codespell", "cspell" }
  end,
})
