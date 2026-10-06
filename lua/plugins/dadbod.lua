local function pick_database()
  local password = os.getenv "MSSQL_SA_PASSWORD" or ""
  local result = vim
    .system({
      "sqlcmd",
      "-S",
      "localhost",
      "-U",
      "sa",
      "-P",
      password,
      "-h",
      "-1",
      "-W",
      "-Q",
      "SET NOCOUNT ON; SELECT name FROM sys.databases ORDER BY name",
    }, { text = true })
    :wait()

  if result.code ~= 0 then
    vim.notify("Could not list databases: " .. result.stdout .. result.stderr, vim.log.levels.ERROR)
    return
  end

  local names = {}
  for line in result.stdout:gmatch "[^\r\n]+" do
    local name = vim.trim(line)
    if name ~= "" then
      table.insert(names, name)
    end
  end

  if #names == 0 then
    vim.notify("No databases found", vim.log.levels.WARN)
    return
  end

  vim.ui.select(names, { prompt = "Database" }, function(choice)
    if not choice then
      return
    end
    vim.cmd "silent! DBUIClose"
    pcall(vim.fn["db_ui#reset_state"])
    vim.g.dbs = {
      { name = choice, url = "sqlserver://sa:" .. password .. "@localhost:1433/" .. choice },
    }
    vim.cmd "DBUI"
  end)
end

return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIClose", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>Dp", pick_database, desc = "Pick database" },
      { "<leader>Dt", "<cmd>DBUIToggle<CR>", desc = "Toggle database explorer" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath "data" .. "/db_ui"
    end,
  },
}
