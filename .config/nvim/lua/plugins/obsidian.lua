return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
  },
  keys = {
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "obsidian backlinks" },
    { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "obsidian links" },
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "new obsidian note" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "search obsidian notes" },
    { "<leader>oq", "<cmd>Obsidian quick_switch<cr>", desc = "quick switch note" },
    { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "obsidian tags" },
    { "<leader>od", "<cmd>Obsidian today<cr>", desc = "today's daily note" },
    { "<leader>ol", "<cmd>Obsidian link_new<cr>", desc = "link selection to new note", mode = "v" },
    { "<leader>ox", "<cmd>Obsidian extract_note<cr>", desc = "extract selection to note", mode = "v" },
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/notes",
      },
    },
    legacy_commands = false,
    ui = {
      enable = true,
    },
    note_id_func = function(title)
      if title ~= nil then
        return title
      else
        return tostring(os.time())
      end
    end,
    wiki_link_func = function(opts)
      if opts.label ~= opts.path then
        return string.format("[[%s|%s]]", opts.path, opts.label)
      else
        return string.format("[[%s]]", opts.path)
      end
    end,
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    callbacks = {
      enter_note = function(client, note)
        local actions = require("obsidian.actions")

        -- gf to follow link under cursor
        vim.keymap.set("n", "gf", actions.smart_action, {
          buffer = true,
          desc = "follow obsidian link",
        })

        -- toggle checkbox
        vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>", {
          buffer = true,
          desc = "toggle checkbox",
        })

        -- navigate between links
        vim.keymap.set("n", "<Tab>", function()
          actions.nav_link("next")
        end, { buffer = true, desc = "next link" })

        vim.keymap.set("n", "<S-Tab>", function()
          actions.nav_link("prev")
        end, { buffer = true, desc = "previous link" })
      end,
    },
  },
}
