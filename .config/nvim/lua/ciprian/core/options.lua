local opt = vim.opt -- for conciseness

-- Line numbers
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show absolute line number on the cursor line (when relative number is on)

-- Tabs and indentation
opt.tabstop = 2 -- Use 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- Set the number of spaces for indentation
opt.expandtab = true -- Convert tabs to spaces
opt.autoindent = true -- Copy indentation from the current line when starting a new one

-- Line wrapping
opt.wrap = false -- Disable line wrapping

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Use case-sensitive search when the search query includes mixed case

-- Cursor line
opt.cursorline = true -- Highlight the current cursor line

-- Appearance
opt.termguicolors = true -- Enable 24-bit RGB colors in the TUI (for true color support)
opt.background = "dark" -- Set background to dark for compatible colorschemes
opt.signcolumn = "yes" -- Always show the sign column to prevent text shifting

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace to delete indents, end-of-line, and start-of-insert

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use the system clipboard as the default register

-- Split windows
opt.splitright = true -- Split vertical windows to the right
opt.splitbelow = true -- Split horizontal windows to the bottom

-- Disable swapfile
opt.swapfile = false -- Disable creating swapfiles
