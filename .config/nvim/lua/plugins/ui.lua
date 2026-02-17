return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local lackluster = require("lackluster")
      lackluster.setup({
        tweak_syntax = {
          string = lackluster.color.gray4,
          string_escape = lackluster.color.gray5,
          comment = lackluster.color.gray3,
          builtin = lackluster.color.gray6,
          type = lackluster.color.gray7,
          keyword = lackluster.color.gray6,
          keyword_return = lackluster.color.gray5,
          keyword_exception = lackluster.color.gray5,
        },
        tweak_highlight = {
          ["@variable"] = { fg = lackluster.color.gray8 },
          ["@function"] = { fg = lackluster.color.gray7 },
          ["@function.call"] = { fg = lackluster.color.gray7 },
          ["@property"] = { fg = lackluster.color.gray6 },
          ["@punctuation"] = { fg = lackluster.color.gray5 },
          ["@operator"] = { fg = lackluster.color.gray5 },
          ["@constant"] = { fg = lackluster.color.gray7 },
          ["@number"] = { fg = lackluster.color.gray6 },
          ["@boolean"] = { fg = lackluster.color.gray6 },
        },
      })
      vim.cmd("colorscheme lackluster-dark")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "lackluster",
        section_separators = "",
        component_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
    },
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },
}
