local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local function is_vim(pane)
    -- this is set by the plugin, and unset on ExitPre in Neovim
    return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
    h = 'Left',
    j = 'Down',
    k = 'Up',
    l = 'Right',
}

local function split_nav(resize_or_move, key)
    return {
        key = key,
        mods = resize_or_move == 'resize' and 'META' or 'CTRL',
        action = wezterm.action_callback(function(win, pane)
            if is_vim(pane) then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
                }, pane)
            else
                if resize_or_move == 'resize' then
                    win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
                else
                    win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
                end
            end
        end),
    }
end

wezterm.on("window-focus-changed", function()
    os.execute(
        'xdotool search -classname org.wezfurlong.wezterm | xargs -I{} xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id {}')
end)

return {
    font =
        wezterm.font('SauceCodePro Nerd Font Mono'),
    font_size = 10,

    color_scheme = 'Monokai Vivid',
    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.7
    },
    -- window_background_opacity = 0.85,
    -- text_background_opacity = 0.7,

    scrollback_lines = 2000,
    adjust_window_size_when_changing_font_size = false,
    hide_tab_bar_if_only_one_tab = true,

    window_frame = {
        font = wezterm.font { family = 'Hack Nerd Font Mono', weight = 'Regular' },
    },

    keys = {
        -- move between split panes
        split_nav('move', 'h'),
        split_nav('move', 'j'),
        split_nav('move', 'k'),
        split_nav('move', 'l'),
        -- -- resize panes
        split_nav('resize', 'h'),
        split_nav('resize', 'j'),
        split_nav('resize', 'k'),
        split_nav('resize', 'l'),
        { key = 'PageUp',   mods = 'SHIFT', action = act.ScrollByPage(-0.5) },
        { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(0.5) },
    },


}
