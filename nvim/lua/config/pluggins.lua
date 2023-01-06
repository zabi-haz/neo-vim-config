local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	--comment pluggin
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	--theme
	use("folke/tokyonight.nvim")
	--cmp pluggins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	--use "hrsh7th/cpm-cmdline"
	use("saadparwaiz1/cmp_luasnip")
	--snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	--lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	-- telescope
	use("nvim-lua/plenary.nvim")
	use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })
	--Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	--formating
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	--autopairs
	use("windwp/nvim-autopairs")
	--auto clsoing tags
	use("alvan/vim-closetag")
	--emmet
	use("mattn/emmet-vim")
  -- sass css
  use { 
    "JulesWang/css.vim",
    "cakebaker/scss-syntax.vim"
  }
  -- color stuff
  --use "luochen1990/rainbow"
  --syn stuff
  --use("dense-analysis/ale")
end)
