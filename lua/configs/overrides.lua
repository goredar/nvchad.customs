local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "go",
    "java",
    "gomod",
    "gosum",
    "hcl",
    "terraform",
    "proto",
  },
  indent = {
    enable = true,
  },
}

M.mason = {}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  scope = { enabled = false },
}

return M
