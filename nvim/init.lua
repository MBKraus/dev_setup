-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("neo-tree").setup({
    filesystem = {
      filtered_items = {
        visible = true, -- This makes sure all files are visible, including hidden ones
        hide_dotfiles = false, -- Set this to false to show dotfiles (hidden files)
      },
    },
  })

-- grant ability to copy into local systems clipboard from remote machines
vim.opt.clipboard = 'unnamedplus'
if vim.env.TMUX then
  vim.g.clipboard = {
    name = 'tmux',
    copy = {
      ['+'] = 'tmux load-buffer -w -',
      ['*'] = 'tmux load-buffer -w -',
    },
    paste = {
      ['+'] = 'tmux save-buffer -',
      ['*'] = 'tmux save-buffer -',
    },
    cache_enabled = 1,
  }
end