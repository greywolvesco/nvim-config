-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Improve autoread
-- Proactively check for external changes on common idle/focus events
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime",
})

-- Friendly notice when a file was reloaded due to external change
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function(args)
    vim.notify(
      ("Reloaded: %s (changed on disk)"):format(vim.fn.fnamemodify(args.file, ":.")),
      vim.log.levels.INFO,
      { title = "autoread" }
    )
  end,
})
