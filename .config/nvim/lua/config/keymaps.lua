local map = vim.keymap.set

-- file operations
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>q=", ":q!<CR>", { desc = "Force quit"})
map("n", "<leader>q-", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    print("No file to delete")
    return
  end
  os.remove(file)
  vim.cmd("qa!")
end, { desc = "Delete current file and quit" })
map("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })
map("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle word wrap" })

-- config
map("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", { desc = "Edit config" })
map("n", "<leader>sr", ":source $MYVIMRC<CR>", { desc = "Source config" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- file explorer
map("n", "<leader>fs", ":Ex<CR>", { desc = "File explorer" })

-- escape
map("i", "jj", "<Esc>")

-- disable arrow keys
for _, mode in ipairs({ "n", "i" }) do
  for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    map(mode, key, "<Nop>", { silent = true })
  end
end

-- window/pane navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom pane" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top pane" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- window/pane splitting
map("n", "<leader>sv", "<C-w>v", { desc = "Split pane vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split pane horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make panes equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current pane" })

-- pane resizing
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase pane height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease pane height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease pane width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase pane width" })

-- buffer navigation
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })

-- move lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- visual line navigation (move by display lines when wrapped)
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- obsidian
map("n", "<leader>nn", ":Obsidian new<CR>", { desc = "Create new note" })
