local status, formatter = pcall(require, "formatter")
if (not status) then
  return
end

local lua_fomatter = {
  -- luafmt
  function()
    return {
      exe = "lua_fmt",
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

local python_formater = {
  function ()
    return {
      exe = "autopep8",
      args = {"-s 4", "-E"},
      replace = 1,
      stdin = true
    }
  end
}

formatter.setup(
  {
    filetype = {
      lua = lua_fomatter,
      java = java_fomatter,
      py = python_formater
    },
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
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
