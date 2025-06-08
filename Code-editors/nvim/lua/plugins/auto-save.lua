return {
  -- other plugins
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = true,
    },
    keys = {
      { "<leader>n", "<cmd>ASToggle<CR>", desc = "Toggle auto-save" },
    },
  },
  -- more plugins
}
