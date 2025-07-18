#!/usr/bin/python3

import os, json, re

ICON_MAP = [
    {"regex": r"Code|Code - Insiders|VSCodium", "icon": ""},
    {"regex": r"Alacritty|Hyper|iTerm2|kitty|Terminal|WezTerm", "icon": ""},
    {"regex": r"Chromium|Google Chrome|Google Chrome Canary", "icon": ""},
    {"regex": r"Finder|访达", "icon": ""},
    {"regex": r"Slack", "icon": ""},
    {"regex": r"Notion", "icon": ""},
    {"regex": r"Spotify", "icon": ""},
    {"regex": r"Mail|HEY|Outlook|Mailspring", "icon": ""},
    {"regex": r"Calendar|Fantastical", "icon": ""},
    {"regex": r"Sequel Ace|Sequel Pro|DataGrip", "icon": ""},
    {"regex": r"ChatGPT", "icon": "󱘖"},
    {"regex": r"Safari|Firefox|Brave Browser|Vivaldi|LibreWolf|qutebrowser", "icon": ""},
    {"regex": r"Discord|Signal|Telegram|Messages", "icon": ""},
    {"regex": r"Microsoft Teams|Teams", "icon": ""},
    {"regex": r"Default", "icon": ""}
]


def to_sup(s):
    sups = {u'0': u'\u2070',
            u'1': u'\xb9',
            u'2': u'\xb2',
            u'3': u'\xb3',
            u'4': u'\u2074',
            u'5': u'\u2075',
            u'6': u'\u2076',
            u'7': u'\u2077',
            u'8': u'\u2078',
            u'9': u'\u2079'}

    return ''.join(sups.get(char, char) for char in str(s))


def to_icon(app):
    for x in ICON_MAP:
        if re.search(x['regex'], app):
            return x['icon']
    return ''  # fallback Nerd Font glyph


def to_formatted_icon(app, c):
    cnt = f" {to_sup(c)}" if c > 1 else ''
    return f"{to_icon(app)}{cnt}"


def to_formatted_icons(apps):
    return ' '.join([to_formatted_icon(app, cnt) for app, cnt in apps.items()])



 # Cleanup: remove old dynamic space items and brackets
for space_index in range(1, 20):
    for index in range(1, 10):
        os.system(f'sketchybar --remove space.{space_index}_{index}')
    os.system(f'sketchybar --remove space.{space_index}_bracket')


# Only count visible windows on each space
spaces = {}
apps = json.loads(os.popen('yabai -m query --windows').read())
for app in apps:
    space_index = app['space']
    if space_index not in spaces:
        spaces[space_index] = {}
    # Only count apps if window is visible on that space
    if app['is-visible']:
        app_name = app['app']
        spaces[space_index][app_name] = spaces[space_index].get(app_name, 0) + 1


args = ''
for space, apps in spaces.items():
    args += f' --set space.{space} background.drawing=on'
    index = 0
    children = []
    for app, cnt in apps.items():
        glyph = to_icon(app)
        index += 1
        item_name = f"space.{space}_{index}"
        children.append(item_name)
        args += f' --remove {item_name} --add item {item_name} left'
        args += f' --set {item_name} icon="{glyph}" icon.drawing=on label.drawing=off'
        args += f' icon.font="Hack Nerd Font:Bold:14.0" icon.padding_right=5'
    bracket_name = f"space.{space}_bracket"
    args += f' --remove {bracket_name} --add bracket {bracket_name} space.{space} {" ".join(children)}'
    args += f' --set {bracket_name} background.drawing=on background.color=0x603c3c3c padding_left=8 padding_right=8'

spaces = json.loads(os.popen('yabai -m query --spaces').read())
for space in spaces:
    if not space['windows']:
        args += f' --set space.{space["index"]} label="" label.drawing=off'

os.system(f'sketchybar -m {args}')
