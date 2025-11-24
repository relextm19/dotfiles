local wezterm = require 'wezterm'

return {
    -- Force Zsh as login shell
    default_prog = {"/usr/bin/zsh", "-l"},
    enable_tab_bar = false,
}
