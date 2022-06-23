from typing import List  # noqa: F401

from libqtile import bar, layout, widget, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import sys
import os

config_dir = os.path.dirname(__file__)
print("Amy's debug: The config dir is : " + config_dir)
from colour import Colour

logo = "mod4"
alt="mod1"

terminal = guess_terminal()
launcher = "amys-launcher"
keyHelp = "key-help " + config_dir

print("Amy's debug: keyHelp=" + keyHelp)

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html

    Key([logo], "menu", lazy.spawn(keyHelp), desc="Show key help"),
    Key([], "pause", lazy.spawn(swaylock), desc="Lock screen"),

    # Switch between windows
    Key([logo], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([logo], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([logo], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([logo], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([alt], "Tab", lazy.group.next_window(), desc="Move focus to next window"),
    Key([alt, "shift"], "Tab", lazy.group.next_window(), desc="Move focus to next window"),
    # Key([alt], ".", lazy.next_screen(), desc='Next monitor')
    Key([logo], "Tab", lazy.next_screen(), desc="Next monitor"),


    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([logo, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([logo, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([logo, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([logo, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([logo, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([logo, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([logo, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([logo, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([logo], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([logo, alt], "d", lazy.screen.next_group(), desc="Go to next screen"),

    # Swap??? windows between left/right columns or up/down in current stack.
    Key([logo, alt], "Left", lazy.layout.flip_left(), desc="Move window to the left"),
    Key([logo, alt], "Right", lazy.layout.flip_right(), desc="Move window to the right"),
    Key([logo, alt], "Down", lazy.layout.flip_down(), desc="Move window down"),
    Key([logo, alt], "Up", lazy.layout.flip_up(), desc="Move window up"),


    # Key([logo, "control"], 'Return', lazy.run_extension(extension.WindowList(
    #     dmenu_prompt=">"
    # ))),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key([logo, "shift"], "Return", lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack"),
    Key([logo], "Return", lazy.spawn(launcher), desc="Show launch menu"),
    Key([logo, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([logo, "control"], "l", lazy.next_layout(), desc="Toggle between layouts"),

    Key([logo], "Delete", lazy.window.kill(), desc="Kill focused window"),

    Key([logo, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([logo, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([logo], "r", lazy.spawncmd(),
    #     desc="Spawn a command using a prompt widget"),

    Key([logo, "control"], "f", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([logo, "control", "shift"], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),

    Key([alt, "control"], "F1", lazy.core.change_vt(1), desc="Go to virtual console 1"),
    Key([alt, "control"], "F2", lazy.core.change_vt(2), desc="Go to virtual console 2"),
    Key([alt, "control"], "F3", lazy.core.change_vt(3), desc="Go to virtual console 3"),
    Key([alt, "control"], "F4", lazy.core.change_vt(4), desc="Go to virtual console 4"),
    Key([alt, "control"], "F5", lazy.core.change_vt(5), desc="Go to virtual console 5"),
    Key([alt, "control"], "F6", lazy.core.change_vt(6), desc="Go to virtual console 6"),
    Key([alt, "control"], "F7", lazy.core.change_vt(7), desc="Go to virtual console 7"),
    Key([alt, "control"], "F8", lazy.core.change_vt(8), desc="Go to virtual console 8"),
    Key([alt, "control"], "F9", lazy.core.change_vt(9), desc="Go to virtual console 9"),
]

# What other window managers often call "workspaces".
groups = [Group(i) for i in ["1", "2", "3", "4", "5", "6", "7", "8", "9",
                             "nixos", "vmware", "maths", "haskell", "qtile"]]

for g in groups:
    shortcut_key=g.name[0];
    # print(f"DEBUG g={g}, shortcut_key={shortcut_key}")
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([logo], shortcut_key, lazy.group[g.name].toscreen(), desc="Switch to group {}".format(g.name)),

        # mod1 + shift + letter of group = move focused window to group
        Key([logo, "shift"], shortcut_key, lazy.window.togroup(g.name), desc="move focused window to group {}".format(g.name)),
    ])

layouts = [
#    layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.Bsp(
        # Border colour(s) for the focused window.
        border_focus=Colour.base0D,
        # Border colour(s) for un-focused windows.
        border_normal=Colour.base04,
	# Border width.
        border_width=6,
        # New clients are inserted in the shortest branch.
	#fair=True,      jupyterlab      jupyterlab


        # Amount by which to grow a window/column.
	#grow_amount=10,
        # New client occupies lower or right subspace.
	#lower_right=True,
	# Margin of the layout (int or list of ints [N E S W]).
        #margin=0,
        # Width/height ratio that defines the partition direction.
        #ratio=1.6
    ),
    layout.Tile(
        # Border colour(s) for the focused window.
        border_focus=Colour.base0D,
        # Border colour(s) for un-focused windows.
        border_normal=Colour.base04,
    )
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

status_bar_widgets = [
    widget.CurrentLayout(),
    widget.CurrentLayoutIcon(),
    widget.CurrentScreen(active_color=Colour.base0A, inactive_colour=Colour.base0D),
    widget.GroupBox(),
    widget.Prompt(),
    # widget.Wlan(
    #         format='{essid} {quality}/70',
    #         update_interval=5
    #     ),
    widget.WindowName(),
    widget.Spacer(length=10),
    widget.Net(
        format='  {interface}: {down} ↓↑ {up}',
        update_interval=10
    ),
    widget.Spacer(length=10),
    widget.Chord(
        chords_colors={
            'launch': ("#ff0000", "#ffffff"),
        },
        name_transform=lambda name: name.upper(),
    ),
    widget.Spacer(length=10),
    widget.ThermalSensor(),
    widget.Spacer(length=10),
    widget.Memory(
        format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
        update_interval=10
    ),
    widget.Spacer(length=10),
    widget.CPU(
        format=' {freq_current}GHz {load_percent}%',
        update_interval=10
    ),
    widget.Spacer(length=10),
    widget.Clock(
        foreground=Colour.base00,
        background=Colour.base0D,
        format='%A, %d %B %Y %H:%M'
    ),
]

screens = [
    Screen(
        bottom=bar.Bar([
            widget.CurrentLayout(),
            widget.CurrentLayoutIcon(),
            widget.CurrentScreen(active_color=Colour.base0A, inactive_colour=Colour.base0D),
            widget.GroupBox(),
            widget.Prompt(),
            # widget.Wlan(
            #         format='{essid} {quality}/70',
            #         update_interval=5
            #     ),
            widget.WindowName(),
            widget.Spacer(length=10),
            widget.Net(
                format='  {interface}: {down} ↓↑ {up}',
                update_interval=10
            ),
            widget.Spacer(length=10),
            widget.Chord(
                chords_colors={
                    'launch': ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Spacer(length=10),
            widget.ThermalSensor(),
            widget.Spacer(length=10),
            widget.Memory(
                format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
                update_interval=10
            ),
            widget.Spacer(length=10),
            widget.CPU(
                format=' {freq_current}GHz {load_percent}%',
                update_interval=10
            ),
            widget.Spacer(length=10),
            widget.Clock(
                foreground=Colour.base00,
                background=Colour.base0D,
                format='%A, %d %B %Y %H:%M'
            ),
        ],
        24)),
    Screen(
        bottom=bar.Bar([
            widget.CurrentLayout(),
            widget.CurrentLayoutIcon(),
            widget.CurrentScreen(active_color=Colour.base0A, inactive_colour=Colour.base0D),
            widget.GroupBox(),
            widget.Prompt(),
            # widget.Wlan(
            #         format='{essid} {quality}/70',
            #         update_interval=5
            #     ),
            widget.WindowName(),
            widget.Spacer(length=10),
            widget.Net(
                format='  {interface}: {down} ↓↑ {up}',
                update_interval=10
            ),
            widget.Spacer(length=10),
            widget.Chord(
                chords_colors={
                    'launch': ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Spacer(length=10),
            widget.ThermalSensor(),
            widget.Spacer(length=10),
            widget.Memory(
                format=' {MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}',
                update_interval=10
            ),
            widget.Spacer(length=10),
            widget.CPU(
                format=' {freq_current}GHz {load_percent}%',
                update_interval=10
            ),
            widget.Spacer(length=10),
            widget.Clock(
                foreground=Colour.base00,
                background=Colour.base0D,
                format='%A, %d %B %Y %H:%M'
            ),
        ],
        24))
]

# Drag floating layouts.
mouse = [
    Drag([logo], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([logo], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([logo], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
# floating_layout = layout.Floating(float_rules=[
#     # Run the utility of `xprop` to see the wm class and name of an X client.
#     *layout.Floating.default_float_rules,
#     Match(wm_class='confirmreset'),  # gitk
#     Match(wm_class='makebranch'),  # gitk
#     Match(wm_class='maketag'),  # gitk
#     Match(wm_class='ssh-askpass'),  # ssh-askpass
#     Match(title='branchdialog'),  # gitk
#     Match(title='pinentry'),  # GPG key password entry
# ])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
