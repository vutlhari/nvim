return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        palettes = {
          nightfox = {
            bg1 = "#131a24",
            black = { base = "#575860", bright = "#393b44", dim = "#353a45" },
            blue = { base = "#86abdc", bright = "#719cd6", dim = "#668aab" },
            cyan = { base = "#7ad5d6", bright = "#63cdcf", dim = "#69a7ba" },
            green = { base = "#8ebaa4", bright = "#81b29a", dim = "#8aa872" },
            magenta = { base = "#baa1e2", bright = "#9d79d6", dim = "#9d7495" },
            red = { base = "#d16983", bright = "#c94f6d", dim = "#a54e56" },
            white = { base = "#e4e4e5", bright = "#dfdfe0", dim = "#bbc3d4" },
            yellow = { base = "#e0c989", bright = "#dbc074", dim = "#d9b263" },
          },
        },
      })

      vim.cmd.colorscheme("nightfox")
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebcb8b" })
    end,
  },
}
