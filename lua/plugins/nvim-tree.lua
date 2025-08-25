return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
      local tree_api = require("nvim-tree.api")
      vim.keymap.set('n', "<leader>tt", tree_api.tree.toggle, { desc = "Toggle file tree" })
    end,
  }
}
