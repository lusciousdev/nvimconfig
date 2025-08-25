return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local ts_builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", ts_builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", ts_builtin.live_grep, { desc = "Telescope live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local ts = require("telescope")
      ts.setup({
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
        },
      })

      ts.load_extension("ui-select")
    end,
  },
}
