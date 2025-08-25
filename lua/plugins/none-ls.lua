return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylelint,

        -- null_ls.builtins.diagnostics.checkmake,
        -- null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.diagnostics.dotenv_linter,

        null_ls.builtins.hover.dictionary,
        null_ls.builtins.hover.printenv,
      },
    })
  end,
}
