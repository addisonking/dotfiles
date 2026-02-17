return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300,
    spec = {
      { "<leader>f", group = "find" },
      { "<leader>s", group = "split" },
      { "<leader>q", group = "quit" },
      { "<leader>o", group = "obsidian" },
      { "<leader>c", group = "code" },
      { "<leader>t", group = "toggle" },
      { "<leader>g", group = "git" },
    },
  },
}
