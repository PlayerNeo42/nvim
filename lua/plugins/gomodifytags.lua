return {
  "simondrake/gomodifytags",
  dependencies = { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  opts = {
    transformation = "snakecase",
    skip_unexported = true,
    override = true,
    options = { "json=omitempty" },
  },
}
