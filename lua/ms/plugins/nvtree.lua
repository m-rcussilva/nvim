local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
    view = {
        adaptive_size = true,
        side = "right",
    },
})
