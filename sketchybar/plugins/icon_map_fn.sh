
function icon_map() {
  case "$1" in
  "Alacritty" | "Hyper" | "iTerm2" | "kitty" | "Terminal" | "终端" | "WezTerm")
    icon_result=""
    ;;
  "App Store")
    icon_result=""
    ;;
  "Discord" | "Discord Canary" | "Discord PTB")
    icon_result=""
    ;;
  "Sequel Ace")
    icon_result=""
    ;;
  "Zed")
    icon_result=""
    ;;
  "1Password")
    icon_result=""
    ;;
  "Finder" | "访达")
    icon_result=""
    ;;
  "Notion")
    icon_result=""
    ;;
  "Brave Browser")
    icon_result=""
    ;;
  "Code" | "Code - Insiders")
    icon_result=""
    ;;
  "Chromium" | "Google Chrome" | "Google Chrome Canary")
    icon_result=""
    ;;
  "Firefox")
    icon_result=""
    ;;
  "Slack")
    icon_result=""
    ;;
  "Spotify")
    icon_result="阮"
    ;;
  "Neovim" | "MacVim" | "Vim" | "VimR")
    icon_result=""
    ;;
  "Default")
    icon_result=""
    ;;
  "Canary Mail" | "HEY" | "Mail" | "Mailspring" | "MailMate" | "邮件")
    icon_result=""
    ;;
  "Calendar"| "Calendario" | "日历" | "Fantastical" | "Cron" | "Amie")
    icon_result=""
    ;;
  "Safari" | "Safari浏览器" | "Safari Technology Preview")
    icon_result=""
    ;;
  "zoom.us")
    icon_result=""
    ;;
  "Preview" | "预览" | "Skim" | "zathura")
    icon_result=""
    ;;
  "Docker" | "Docker Desktop")
    icon_result=""
    ;;
  "Sublime Text")
    icon_result=""
    ;;
  "Warp")
    icon_result=""
    ;;
  "Messages" | "信息" | "Nachrichten")
    icon_result=""
    ;;
  "FaceTime" | "FaceTime 通话")
    icon_result=""
    ;;
  "Microsoft Teams")
    icon_result=""
    ;;
  "Bear")
    icon_result=""
    ;;
  "System Preferences" | "System Settings" | "系统设置")
    icon_result=""
    ;;
  "Nova")
    icon_result=""
    ;;
  "WhatsApp" | "WhatsApp Desktop" | "Whats App" | "WhatsApp (Geral)")
    icon_result=""
    ;;
  *)
    icon_result=""
    ;;
  esac
}

icon_map "$1"

echo "$icon_result"