local status, formatter = pcall(require, "formatter")
if (not status) then
  return
end

local lua_fomatter = {
  -- luafmt
  function()
    return {
      exe = "luafmt",
      args = {"--indent-count", 2, "--stdin"},
      stdin = true
    }
  end
}

local java_fomatter = {
  function()
    return {
      exe = "astyle",
      args = {"--mode=java"},
      stdin = true
    }
  end
}

formatter.setup(
  {
    filetype = {
      lua = lua_fomatter,
      java = java_fomatter
    }
  }
)

--配置保存文件自动格式化代码
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
  true
)