-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- ~/.config/nvim/lua/custom/plugins/init.lua
return {
  {
    'junegunn/fzf.vim',
    dependencies = {
      {
        'junegunn/fzf',
        build = './install --bin',
      },
    },
  },
  {
    'fatih/vim-go',
    ft = { 'go' },
    build = ':GoUpdateBinaries',
    init = function()
      -- vim-go needs these set before it loads
      vim.g.go_fmt_autosave = 1
      vim.g.go_fmt_command = 'goimports'
      vim.g.go_fmt_fail_silently = 1
      vim.g.go_list_type = 'quickfix'
      vim.g.go_def_mode = 'gopls'
      vim.g.go_info_mode = 'gopls'
    end,
    config = function()
      local group = vim.api.nvim_create_augroup('vim_go_keymaps', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = 'go',
        callback = function()
          local opts = { silent = true, buffer = true }
          vim.keymap.set('n', '<leader>b', '<Plug>(go-build)', opts)
          vim.keymap.set('n', '<leader>tc', '<Plug>(go-test-compile)', opts)
          vim.keymap.set('n', 'gs', '<Plug>(go-decls)', opts)
        end,
      })
    end,
  },
}
