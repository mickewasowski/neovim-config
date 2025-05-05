vim.api.nvim_create_user_command('WO', function(opts)
  local filepath = opts.args
  if filepath ~= '' then
    vim.fn.jobstart({ 'wslview', filepath }, { detach = true })
    print('Opened with wslview: ' .. filepath)
  else
    print('Please provide a file path, e.g., :Wslview ./image.png')
  end
end, { nargs = 1, complete = 'file' })

vim.keymap.set('n', '<leader>wo', function()
  local filepath = vim.fn.expand('%:p')
  vim.fn.jobstart({ 'wslview', filepath }, { detach = true })
  print('Opened with wslview: ' .. filepath)
end, { desc = 'Open current file with wslview' })

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.{png,jpg,jpeg,webp,gif}",
  callback = function(args)
    local file_path = vim.fn.fnamemodify(args.file, ":p")
    vim.fn.jobstart({ "wslview", file_path }, { detach = true })
  end,
  group = general,
  desc = "Open image files with wslview",
})
