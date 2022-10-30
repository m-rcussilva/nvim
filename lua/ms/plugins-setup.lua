local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocomando that reloads neovim when you sabe this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use('wbthomason/packer.nvim')
    use("nvim-lua/plenary.nvim") -- All the lua functions
    use("rebelot/kanagawa.nvim") -- Colorscheme
    use("szw/vim-maximizer") -- Maximize and restore the current split window
    use("numToStr/Comment.nvim") -- Comment a single line or multiple lines
    use("nvim-tree/nvim-web-devicons") -- Web Dev Icons
    use("nvim-tree/nvim-tree.lua") -- File explorer
    use("romgrk/barbar.nvim") -- Tabline
    use("nvim-lualine/lualine.nvim") -- Status line
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Fuzzy finding
    use({"nvim-telescope/telescope.nvim", branch = "0.1.0"}) -- Fuzzy finding
    use("hrsh7th/nvim-cmp") -- Autocompletion
    use("hrsh7th/cmp-buffer") -- Autocompletion
    use("hrsh7th/cmp-path") -- Autocompletion
    use("L3MON4D3/LuaSnip") -- Snippets
    use("saadparwaiz1/cmp_luasnip") -- Snippets
    use("rafamadriz/friendly-snippets") -- Snippets

    use("williamboman/mason.nvim") -- LSP servers
    use("williamboman/mason-lspconfig.nvim") 
    use("neovim/nvim-lspconfig") -- Configuration for nvim LSP
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })

    use("windwp/nvim-autopairs") -- autopairs
    use("windwp/nvim-ts-autotag") -- autotag
    use({ "akinsho/toggleterm.nvim", tag = "*" })
    use("norcalli/nvim-colorizer.lua")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
