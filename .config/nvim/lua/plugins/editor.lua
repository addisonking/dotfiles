return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = true,
        [""] = true,
        ["markdown"] = true,
      }
    end,
  },
}
