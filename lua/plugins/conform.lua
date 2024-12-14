return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
        typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
      },
      format_on_save = {
        timeout_ms = 10000,
        lsp_format = "fallback",
      },
    })
  end,
}
