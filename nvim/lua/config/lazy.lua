local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Python LSP server setup
-- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        black = {
          enabled = true,
        },
        isort = {
          enabled = true,
        },
        -- pylint is only works from a binary but will throw errors for imports
        pylint = {
          enabled = false,
          executable = "pylint",
        },
        ruff = {
          enabled = true,
        },
        pyflakes = {
          enabled = false,
        },
        pycodestyle = {
          enabled = false,
        },
        jedi_completion = {
          fuzzy = true,
        },
      },
    },
  },
})


-- smartyank
require("smartyank").setup({
  highlight = {
    enabled = true, -- highlight yanked text
    higroup = "IncSearch", -- highlight group of yanked text
    timeout = 2000, -- timeout for clearing the highlight
  },
  clipboard = {
    enabled = true,
  },
  tmux = {
    enabled = true,
    -- remove `-w` to disable copy to host client's clipboard
    cmd = { "tmux", "set-buffer", "-w" },
  },
  osc52 = {
    enabled = true,
    -- escseq = 'tmux',     -- use tmux escape sequence, only enable if
    -- you're using tmux and have issues (see #4)
    ssh_only = true, -- false to OSC52 yank also in local sessions
    silent = false, -- true to disable the "n chars copied" echo
    echo_hl = "Directory", -- highlight group of the OSC52 echo message
  },
  -- By default copy is only triggered by "intentional yanks" where the
  -- user initiated a `y` motion (e.g. `yy`, `yiw`, etc). Set to `false`
  -- if you wish to copy indiscriminately:
  -- validate_yank = false,
  --
  -- For advanced customization set to a lua function returning a boolean
  -- for example, the default condition is:
  -- validate_yank = function() return vim.v.operator == "y" end,
})
