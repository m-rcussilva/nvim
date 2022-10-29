local setup, barbar = pcall(require, "barbar-config")
if not setup then
    return
end

barbar.setup({
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    hide = {current = false, inactive = false, visible = false},
    icons = true,
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
})
