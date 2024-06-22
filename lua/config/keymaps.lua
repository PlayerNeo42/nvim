-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Helper functions
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

-- NOTE: Remove default keymaps
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("n", "H")
vim.keymap.del("n", "L")
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("i", "<C-s>")
vim.keymap.del("x", "<C-s>")
vim.keymap.del("n", "<C-s>")
vim.keymap.del("s", "<C-s>")
vim.keymap.del("n", "<C-/>")
vim.keymap.del("n", "<leader>l")
if not vim.g.vscode then
  -- This cause error output in vscode
  vim.keymap.del("n", "<leader>qÞ")
end

-- Floating terminal
vim.keymap.set({ "n", "i" }, "<C-`>", lazyterm)
vim.keymap.set("t", "<C-`>", "<cmd>close<CR>")

-- Buffer(Tab) switch using <Tab>
vim.keymap.set("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<leader>kq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Save all buffers
vim.keymap.set("n", "<leader>j", "<cmd>wa<cr>", { desc = "Save All" })

-- Use H/L to move to beginning/end of line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("x", "H", "^")
vim.keymap.set("x", "L", "$")

-- Use H/L to move to beginning/end of line
vim.keymap.set("n", "gi", "<cmd>normal gI<cr>")

-- Comment line
vim.keymap.set({ "n", "i", "x" }, "<C-/>", "<cmd>normal gcc<cr>")

-- Code format
vim.keymap.set({ "n", "v" }, "<leader>l", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

if vim.g.vscode then
  local vscode = require("vscode")
  local function set_vscode_keymap(mode, keys, command, description)
    vim.keymap.set(mode, keys, function()
      vscode.call(command)
    end, { desc = description })
  end

  -- Set keymaps using the helper function
  set_vscode_keymap("n", "<tab>", "workbench.action.nextEditor", "Next Editor")
  set_vscode_keymap("n", "<S-tab>", "workbench.action.previousEditor", "Previous Editor")
  set_vscode_keymap("n", "<leader>l", "editor.action.formatDocument", "Format")
  set_vscode_keymap("n", "<leader>q", "workbench.action.closeOtherEditors", "Quit Other")
  set_vscode_keymap("n", "<leader>i", "inlineFold.toggle", "Inline Fold Toggle")
  set_vscode_keymap("n", "<leader>j", "saveAll", "Save All")
end

if vim.g.neovide then
  vim.keymap.set({ "i", "n" }, "<D-s>", "<cmd>w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set({ "c", "i" }, "<D-v>", "<C-R>+") -- Paste
  vim.keymap.set({ "n", "i", "x" }, "<D-/>", "<cmd>normal gcc<cr>") -- Comment line
end
