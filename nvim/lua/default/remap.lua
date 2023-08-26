vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- save
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "g_")

vim.keymap.set("n", "//", ":noh<CR>")

vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<C-a>", "ggVG")

vim.keymap.set("n", "<M-Up>",    "<C-w>k_")
vim.keymap.set("n", "<M-Down>",  "<C-w>j_")
vim.keymap.set("n", "<M-Left>",  "<C-w>h_")
vim.keymap.set("n", "<M-Right>", "<C-w>l_")
vim.keymap.set("i", "<M-Up>",    "<ESC><C-w>k_")
vim.keymap.set("i", "<M-Down>",  "<ESC><C-w>j_")
vim.keymap.set("i", "<M-Left>",  "<ESC><C-w>h_")
vim.keymap.set("i", "<M-Right>", "<ESC><C-w>l_")

vim.keymap.set("n", "tt", ":tabnew<CR>")

vim.keymap.set("n", "<C-h>", ":tabp<CR>")
vim.keymap.set("n", "<C-l>", ":tabn<CR>")
vim.keymap.set("i", "<C-h>", "<ESC>:tabp<CR>")
vim.keymap.set("i", "<C-l>", "<ESC>:tabn<CR>")

-- trim whitespace
vim.keymap.set("n", "<leader><SPACE>", ":%s/\\s\\+$//e<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

