-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "jk", "<ESC>", { desc = "esc" })
map("i", "kj", "<ESC>", { desc = "esc" })

map("n", "<C-h>", "<C-w>h", { desc = "move right" })
map("n", "<C-j>", "<C-w>j", { desc = "move left" })
map("n", "<C-k>", "<C-w>k", { desc = "move top" })
map("n", "<C-l>", "<C-w>l", { desc = "move down" })
