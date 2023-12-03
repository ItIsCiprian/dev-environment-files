-- Use a local variable 'opt' for conciseness
local opt = vim.opt

-- Line numbers
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show absolute line number on the cursor line (when relative number is on)

-- Tabs & indentation
opt.tabstop = 2 -- Set tab width to 2 spaces (prettier default)
opt.shiftwidth = 2 -- Set indentation width to 2 spaces
opt.expandtab = true -- Expand tabs to spaces
opt.autoindent = true -- Automatically copy indent from the current line when starting a new one

-- Line wrapping
opt.wrap = false -- Disable line wrapping

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If you include mixed case in your search, assume you want it to be case-sensitive

-- Cursor line
opt.cursorline = true -- Highlight the current cursor line

-- Appearance

-- Turn on termguicolors for the nightfly colorscheme to work
-- (Requires a true color terminal, such as iTerm2)
opt.termguicolors = true
opt.background = "dark" -- Colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- Show the sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line, or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use the system clipboard as the default register

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Turn off swapfile
opt.swapfile = false -- Disable swapfile usage
