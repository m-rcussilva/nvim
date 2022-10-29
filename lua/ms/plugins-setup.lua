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

    if packer_bootstrap then
        require("packer").sync()
    end
end)
