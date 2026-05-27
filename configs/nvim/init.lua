vim.g.mapleader = " "

-- ======================
-- Basic Settings
-- ======================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.keymap.set("i", "kj", "<Esc>")

-- ======================
-- Lazy bootstrap
-- ======================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- ======================
-- Plugins
-- ======================

require("lazy").setup({

  -- Theme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<S-p>", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)

    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",

    config = function()

      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")

      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

    end,
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()

      local cmp = require("cmp")

      cmp.setup({

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = {
          { name = "nvim_lsp" },
        },

      })

    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",

    config = function()

      require("conform").setup({

        formatters_by_ft = {
          c = { "clang_format" },
          cpp = { "clang_format" },
          python = { "black" },
        },

      })

      vim.keymap.set("n", "<leader>f", function()
        require("conform").format()
      end)

    end,
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },

})
