local utils = require "core.utils"

local map = utils.map

map("i", "<leader><leader>", "<ESC>")

-- move cursor
map("i", "<C-h>", "<Left>")
map("i", "<C-e>", "<End>")
map("i", "<C-l>", "<Right>")
map("i", "<C-k>", "<Up>")
map("i", "<C-j>", "<Down>")
map("i", "<C-a>", "<ESC>^i")

map("n", "B", "^")
map("n", "E", "$")
map("v", "B", "^")
map("v", "E", "$")

-- save and quit
map("i", "<leader>w", "<ESC>:w<CR>")
map("i", "<leader>q", "<ESC>:q!<CR>")
map("i", "<leader>wq", "<ESC>:wq<CR>")
map("i", "<leader>xa", "<ESC>:xa<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>xa", ":xa<CR>")

-- buffers
map("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>")
map("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>")
map("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>")
map("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>")
map("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>")
map("n", "<leader>b6", ":BufferLineGoToBuffer 6<CR>")
map("n", "<leader>b7", ":BufferLineGoToBuffer 7<CR>")
map("n", "<leader>b8", ":BufferLineGoToBuffer 8<CR>")
map("n", "<leader>b9", ":BufferLineGoToBuffer 9<CR>")
map("n", "<leader>bq", ":BufferLinePickClose <CR>")

-- tabs
map("n", "<leader>t", "<cmd> :tabnew <CR>")
map("n", "<leader>1", "1gt")
map("n", "<leader>2", "2gt")
map("n", "<leader>3", "3gt")
map("n", "<leader>4", "4gt")
map("n", "<leader>5", "5gt")
map("n", "<leader>6", "6gt")

-- windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
map("n", "<leader>aa", ":vertical resize -40<CR>")
map("n", "<leader>dd", ":vertical resize +40<CR>")

-- folding
map("n", "<space>", "@=((foldclosed(line('.')) < 1) ? 'zc' : 'zo')<CR>")
map("n", "rr", "zR")
map("n", "mm", "zM")

-- Plugins

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle <CR>")

-- telescope
map("n", "<C-f>", ":Telescope find_files <CR>")
map("n", "<C-u>", ":Telescope live_grep <CR>")
map("n", "<C-b>", ":Telescope buffers <CR>")
map("n", "<C-s>d", ":Telescope lsp_document_symbols <CR>")
map("n", "<C-s>w", ":Telescope lsp_workspace_symbols <CR>")
map("n", "<C-g>c", ":Telescope git_commits <CR>")
map("n", "<C-g>b", ":Telescope git_bcommits <CR>")
