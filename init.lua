-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- === local variable ===
local set = vim.opt
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local expand = vim.fn.expand

-- === general configuration ===

set.backup = false --disable backup files
set.writebackup = false --disable writebackup
set.swapfile = false --disable swap file
set.errorbells = false --disable error bells
set.visualbell = false --disable visual bells
set.belloff = "all" --disable all bells
cmd("filetype plugin indent on") --enable filetype, plugin, indent
set.encoding = "utf-8" --set enconding to UTF-8
set.fileformats = { "unix", "dos", "mac" } --set file formats
set.clipboard = "unnamed" --use system clipboard
set.mouse = "" --disable mouse in all modes
set.hlsearch = true --highlight matches
set.showmatch = true --highlight matching perentheses
set.incsearch = true --match incrementally
set.ignorecase = true --ignore case
set.smartcase = true --case sensitive when at least one uppercase appears
set.showcmd = false --don't show command
set.showmode = false --don't show mode
set.autoread = true --auto read changed file

-- === editing configuration ===
set.tabstop = 4 --spaces per tab
set.shiftwidth = 4 --spaces for auto-indent
set.softtabstop = 4 --spaces per tab in insert mode
set.expandtab = true --convert a tab to spaces
set.smarttab = true --smart tab in C-like language
set.autoindent = true --auto-indent
set.smartindent = true --smart indent
set.cindent = true --C-style indent
set.wrap = true --enable wrap
set.linebreak = true --wrap at breakat characters
set.textwidth = 0 --limitless line length
set.wrapmargin = 3 --right margin
set.formatoptions = "tcrqnlj" --wrap normal text, comment, and block comment, continue comment when press <CR>, keep numbered lists aligned, don't break long word, remove comment sign when joining lines

-- === UI configuration ===
set.cursorline = true --highlight current line
set.cursorcolumn = true --highlight current column
set.relativenumber = true --use relative line number
set.termguicolors = true --enable true(256) colors
set.background = "dark" --use dark background
set.guicursor = {
  "n-v-c:block", --use block cursor in noraml, visual and command-line modes
  "ve:hor50", --use 50% horizontal bar in visual mode with selection
  "o:hor10", --use 10% horizontal bar in operator-pending mode
  "i-ci:ver12", --use 12% vetical bar in insert and command-line insert modes
  "r-cr:ver30", --use 30% vertical bar in replace and command-line replace modes
  "sm:ver50", --use 50% vertical bar in showmatch in insert mode
}
set.guifont = "ComicShannsMono Nerd Font:h18"
set.hidden = true --allow switching buffers without saving
set.splitbelow = true --horizontal split below
set.splitright = true --vertical split to right
set.foldlevel = 3 --close all 3+ level folds
set.foldnestmax = 12 --maximum nested fold levels to 12
set.foldminlines = 3 --allow  create folds fot 3+ lines block
set.foldcolumn = "1" --use 1 column to show fold signs
set.scrolloff = 3 --keep 3 lines above and below
set.sidescrolloff = 3 --keep 3 columns to the left and right sides
set.mousehide = true --hide mouse when typing

-- === keymaps ===
vim.g.mapleader = "\\" --use backslash as leader key in all modes
map("i", "<leader><leader>", "\\", {
  desc = "insert a backslash in insert mode",
})
map("c", "<leader><leader>", "\\", {
  desc = "insert a backslash in command-line mode",
})
map("n", "<Tab>", "i<Tab><Esc>", {
  desc = "insert a tab",
})
map("n", "<Space>", "i<Space><Esc>", {
  desc = "insert a space",
})
map("n", "<Del>", "X", {
  desc = "delete previous character",
})
map("n", "<BS>", "x", {
  desc = "delete current character",
})
map("n", "<C-n>", "o<Esc>", {
  desc = "insert a new line below",
})
map("n", "<C-p>", "O<Esc>", {
  desc = "insert a new line above",
})
map("n", "<leader>b", ":ls<CR>", {
  desc = "view all buffers",
})
map("n", "<leader>n", ":vert sbn<CR>", {
  desc = "vertical split next buffer",
})
map("n", "<leader>p", ":vert sbp<CR>", {
  desc = "vertical split previous buffer",
})
map("n", "<leader>f", ":vert sbf<CR>", {
  desc = "vertial split first buffer",
})
map("n", "<leader>l", ":vert sbl<CR>", {
  desc = "vertical split last buffer",
})
map("n", "<leader>N", ":w<CR>:vert sbn<CR>", {
  desc = "vertical split next buffer",
})
map("n", "<leader>P", ":w<CR>:vert sbp<CR>", {
  desc = "vertical split previous buffer",
})
map("n", "<leader>F", ":w<CR>:vert sbf<CR>", {
  desc = "vertial split first buffer",
})
map("n", "<leader>L", ":w<CR>:vert sbl<CR>", {
  desc = "vertical split last buffer",
})

-- === autocommands ===
autocmd("BufWritePre", {
  callback = function()
    cmd([[silent! :%s/\s\+$//e]])
  end,
  desc = "remove trailing whitespaces",
})
autocmd("BufEnter", {
  callback = function()
    if expand("%:p") ~= "" then
      cmd("lcd " .. expand("%:p:h"))
    end
  end,
  desc = "change to current file directory",
})
