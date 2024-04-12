echo "Welcome to Sanbid Config"

set -eu
currentdir=$(pwd)
echo "$currentdir"

## installing yay
if command -v yay &>/dev/null; then
	echo "yay is installed"
else
	cd /tmp
	git clone https://archlinux.org/yay
	cd yay
	mkpkg -si
	cd "$currentdir"
fi

## applications to be installed
applications=("aylurs-gtk-shell" "alacritty" "dunst" "fish" "gtk4" "hyprland"
	"kitty" "neovim" "tmux" "vivid" "waybar" "wpaperd" "starship" "rustup" "ripgrep" "fd"
	"dua-cli" "stow" "ansible" "wofi" "brightnessctl" "bat" "bc" "gnome-bluetooth-3.0" "dolphin"
	"dolphin-plugins" "dog" "fastfetch" "base-devel" "firefox" "fzf" "xh" "gvfs"
	"gzip" "unzip" "jq" "kvantum" "kvantum-qt5" "lua" "luarocks" "mpv" "luarocks"
	"npm" "podman" "podman-docker" "polkit" "telegram-desktop" "tesseract" "tesseract-data-eng"
	"tesseract-data-nep" "thorium-browser-bin" "thunar" "vim" "vlc" "acpi" "wps-office" "zoxide" "pamixer"
  "wlsunset" "fuzzel" "git-delta"
)

# installing applications
for app in "${applications[@]}"; do
	if pacman -Qq | grep -w "$app" &>/dev/null; then
		echo -e "\033[32m$app\033[0m is already installed...."
		sleep 0.5
	else
		echo "$app is installing"
		yay -S "$app" --noconfirm
	fi
done

# file configurations
configDir="$HOME/.config"
checkdirectory=(
	"ags" "alacritty" "dunst" "fish" "gtk-3.0" "gtk-4.0" "hypr" "kitty"
	"nvim" "tmux" "vivid" "waybar" "wpaperd"
)

for dir in "${checkdirectory[@]}"; do
	if [[ -d "$configDir/$dir" ]]; then
		echo "$configDir/$dir directory exist!!"
    sleep 0.3
	fi
done
