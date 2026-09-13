return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost",
    opts = {
      provider_selector = function()
        return { "lsp", "indent" }
      end,
    },
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function(_, opts)
      local ufo = require "ufo"
      ufo.setup(opts)

      local map = vim.keymap.set
      map("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
      map("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
      map("n", "zK", function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end, { desc = "Peek folded lines or hover" })
    end,
  },
}
