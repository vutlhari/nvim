return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = function()
    return {
      indent = { char = "•" },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = { enabled = false },
    }
  end,
}
