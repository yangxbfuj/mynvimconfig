local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd(
  [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]]
)

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"
    use "folke/tokyonight.nvim"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use {
      "nvim-tree/nvim-tree.lua", -- 文件树插件
      requires = "nvim-tree/nvim-web-devicons"
    }
    use "christoomey/vim-tmux-navigator" -- 用ctl-hjkl来定位窗口
    use "nvim-treesitter/nvim-treesitter" -- 语法高亮
    use "HiPhish/nvim-ts-rainbow2" -- 彩虹括号
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
      "neovim/nvim-lspconfig"
    }
    -- 自动补全
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path" -- 文件路径
    use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"
    use "onsails/lspkind-nvim"
    use "numToStr/Comment.nvim" -- gcc和gc注释
    use "windwp/nvim-autopairs" -- 自动补全括号
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-jdtls'
    use 'nvim-lua/plenary.nvim'
    use "akinsho/bufferline.nvim" -- buffer分割线
    use "lewis6991/gitsigns.nvim" -- 左则git提示
    use "HallerPatrick/py_lsp.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.1", -- 文件检索
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use "mhartington/formatter.nvim" -- 格式化插件
    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
