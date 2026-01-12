vim.g.scrollback_mode = vim.env.SCROLLBACK_MODE or "default"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
