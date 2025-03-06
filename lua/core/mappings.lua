local map = vim.keymap.set

map("n", "<C-a>", "gg<S-v>G", { desc = "[S]elect All [D]ocument" })
map("n", "<leader>tt", "<cmd>lua require('themer.picker').setup()<cr>", { desc = "[P]ick [T]heme" })
map("n", "<leader>gg", "<cmd>lua require('core.functions').lazygit_toggle()<cr>", { desc = "[L]azygit [T]oggle" })
map("n", "<leader>rr", "<cmd>lua require('core.functions').ranger_toggle()<cr>", { desc = "[R]anger [T]oggle" })
