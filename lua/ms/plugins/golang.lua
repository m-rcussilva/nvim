local setup, golang = pcall(require, "go")
if not setup then
	return
end

golang.setup({
	go = "go", -- go command, can be go[default] or go1.18beta1
	goimport = "gopls", -- goimport command, can be gopls[default] or goimport
	fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls
	gofmt = "gofumpt", --gofmt cmd,
})
