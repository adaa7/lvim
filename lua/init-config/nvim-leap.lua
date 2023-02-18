local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }
local pluginKeys = {}
require('leap').opts.highlight_unlabeled_phase_one_targets = true
vim.keymap.set({'x', 'o', 'n'}, 'f', '<Plug>(leap-forward-to)')
vim.keymap.set({'x', 'o', 'n'}, 'F', '<Plug>(leap-backward-to)')
vim.keymap.set({'x', 'o', 'n'}, 'gf', '<Plug>(leap-cross-window)')
return pluginKeys
