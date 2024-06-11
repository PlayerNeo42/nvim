return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = vim.opt.sessionoptions:get() },
  keys = {
    { "<leader>qs", false },
    { "<leader>ql", false },
    { "<leader>qd", false },
    {
      "<leader>ks",
      function()
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>kl",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>kd",
      function()
        require("persistence").stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}
