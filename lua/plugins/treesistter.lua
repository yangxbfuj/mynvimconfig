require'nvim-treesitter.configs'.setup {
  -- 添加不同的语言
  ensure_installed = {
    "vim",
    "html",
    "bash",
    "c",
    "cpp",
    "javascript",
    "json",
    "lua",
    "python",
    "java",
    "vue"
  },

  hightlight = { enable = true },
  indent = { enable = true },
  -- 不同括号颜色区分
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
