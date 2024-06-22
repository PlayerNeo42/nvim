return {
  "folke/flash.nvim",
  keys = {
    { "s", false },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
  },
}
