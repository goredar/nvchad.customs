local vim = vim
local overrides = require "configs.overrides"

return {
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"

      conf.defaults.mappings.i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<Esc>"] = actions.close,
      }

      conf.defaults.file_ignore_patterns = { ".git/", "node_modules/" }
      conf.pickers = {
        find_files = {
          hidden = true,
        },
      }

      return conf
    end,
  },
  -- { "nvim-java/nvim-java" },
  { "mfussenegger/nvim-jdtls" },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
      },
      { "rshkarin/mason-nvim-lint" },
      { "folke/neoconf.nvim" },
      { "microsoft/python-type-stubs" },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
      require "configs.lint"

      require("mason-nvim-lint").setup()
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {}
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require "configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
          require "configs.mason-tool-installer"
        end,
        lazy = false,
      },
    },
    opts = overrides.mason,
  },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  --
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  --
  {
    "hrsh7th/nvim-cmp",
    dependencies = {},
    opts = function()
      local opts = require "nvchad.configs.cmp"

      opts.mapping["<C-f>"] = opts.mapping["<CR>"]
      opts.mapping["<C-j>"] = opts.mapping["<Tab>"]
      opts.mapping["<C-k>"] = opts.mapping["<S-Tab>"]

      opts.sources = {
        { name = "minuet", group_index = 1, priority = 100 },
        { name = "nvim_lsp" },
        { name = "codeium" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = "luasnip" },
        { name = "nvim_lua" },
        { name = "lazydev" },
        { name = "path" },
      }

      opts.performance = {
        fetching_timeout = 2000,
      }

      return opts
    end,
  },

  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
    lazy = false,
  },
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup {
        enabled = false,
        provider = "codestral",
        throttle = 2000,
        debounce = 700,
        provider_options = {
          codestral = {
            model = "codestral-latest",
            end_point = "https://api.mistral.ai/v1/fim/completions",
            api_key = "MISTRAL_API_KEY",
          },
        },
      }
    end,
    lazy = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = overrides.blankline,
  },

  {
    "b0o/schemastore.nvim",
  },

  {
    "farmergreg/vim-lastplace",
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
  },

  {
    "ggandor/leap.nvim",
    dependencies = {
      {
        "tpope/vim-repeat",
        lazy = false,
      },
    },
    config = function()
      require("leap").add_default_mappings()
    end,
    lazy = false,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-X>]],
        -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
        direction = "float",
      }
    end,
    lazy = false,
  },
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    opts = {
      -- your configuration comes here
      -- for example
      enabled = true, -- if you want to enable the plugin
      message_template = "    [<date>] <author> | <summary>", -- template for the blame message, check the Message template section for more options
      date_format = "%Y-%m-%d", -- template for the date, check Date format section for more options
      virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      local ai = require "mini.ai"
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter { -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          },
          f = ai.gen_spec.treesitter { a = "@function.outer", i = "@function.inner" }, -- function
          c = ai.gen_spec.treesitter { a = "@class.outer", i = "@class.inner" }, -- class
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
          d = { "%f[%d]%d+" }, -- digits
          e = { -- Word with case
            { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
            "^().*()$",
          },
          u = ai.gen_spec.function_call(), -- u for "Usage"
          U = ai.gen_spec.function_call { name_pattern = "[%w_]" }, -- without dot in function name
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },

  -- Disabled
  { "NvChad/nvterm", enabled = false },
  { "NvChad/nvim-colorizer.lua", enabled = false },
}
