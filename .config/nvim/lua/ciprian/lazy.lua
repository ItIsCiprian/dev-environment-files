-- Path for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is not installed, and install it if not found
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Prepend the lazypath to the runtimepath
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup({
  { import = "ciprian.plugins" },
  { import = "ciprian.plugins.lsp" },
}, {
  install = {
    colorscheme = { "catppuccin" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- Install 'vim-floaterm' using a plugin manager
vim.cmd("Plug 'voldikss/vim-floaterm'")

-- Configure vim-floaterm for lazygit
vim.g.floaterm_keymap_new = "<F1>"
vim.g.floaterm_keymap_next = "<F2>"
vim.g.floaterm_keymap_prev = "<F3>"
vim.g.floaterm_keymap_toggle = "<F4>"
vim.g.floaterm_keymap_kill = "<F12>"

-- Define the command to open lazygit in floaterm
vim.cmd([[
  autocmd FileType lazygit nnoremap <buffer> q :q<CR>
  autocmd FileType lazygit nnoremap <buffer> <C-s> :call LazygitToggleStaging()<CR>
  autocmd FileType lazygit nnoremap <buffer> <C-c> :call LazygitClearHunk()<CR>
]])

-- Function to open lazygit
function OpenLazygit()
  vim.cmd("FloatermNew --wintype=split --width=0.9 --height=0.9 lazygit")
end

-- Map a key to open lazygit using the defined function
vim.api.nvim_set_keymap("n", "<Leader>lg", ":lua OpenLazygit()<CR>", { noremap = true, silent = true
