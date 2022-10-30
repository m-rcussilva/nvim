local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
    return
end

toggleterm.setup({
    open_mapping = [[<c-t>]],
	size = 20,
	shade_terminals = true,
	direction = "float",
	float_opts = {
		border = "curved",
	},
    hide_numbers = true,
	close_on_exit = true,
})
