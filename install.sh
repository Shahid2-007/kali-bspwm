#!/bin/bash

echo "run btop"
dir=$(dirname -- "$(readlink -f -- "$0")")
user=$(whoami)
home=/home/$(user)
config=$home/.config/
sudo apt install -y pipewire pipewire-pulse pipewire-alsa alsa-utils wireplumber libspa-0.2-bluetooth bluez bluez-tools \
  blueman network-manager xorg xserver-xorg x11-xserver-utils xserver-xorg-video-intel xserver-xorg-input-libinput \
  lightdm lightdm-gtk-greeter plymouth plymouth-themes kali-themes dunst libnotify-bin xclip pamixer feh jq picom \
  neovim ncdu duf lsd eza bspwm sxhkd kitty fish base-passwd bsdutils coreutils dpkg grep sed tar gzip util-linux \
  procps mount betterlockscreen exfatprogs exfat-fuse git net-tools xdotool ffmpeg 7zip mate-polkit brightnessctl \
  poppler-utils fd-find fzf zoxide imagemagick rofi polybar pcmanfm firefox-esr build-essential autoconf automake \
  pkg-config systemd ripgrep fakeroot base-files dbus-x11 flameshot lxappearance openvpn pkexec arch-install-scripts \
  tldr obs-studio gvfs-backends gvfs-daemons gvfs-fuse fdupes

echo "cursor-theme-name=Bibata-Modern-Ice
cursor-theme-size=24" | sudo tee -a /etc/lightdm/lightdm-gtk-greeter.conf

systemctl --user enable --now pipewire
systemctl --user enable --now pipewire-pulse
systemctl --user enable --now wireplumber
sudo systemctl enable bluetooth --now
sudo systemctl enable NetworkManager
sudo plymouth-set-default-theme kali
echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/default/locale
echo "LANG=en_US.UTF-8" | sudo tee /etc/default/locale
sudo nano /etc/locale.gen && sudo locale-gen

sudo mkdir -p /usr/share/fonts/truetype/nerd-fonts/ /usr/share/icons /usr/local/bin/ $home/.wallpapers/ \
  $config/kitty $config/nvim $config/yazi $config/bspwm $config/fish $config/picom $config/polybar \
  $config/rofi $config/sxhkd $home/.local/share/applications
sudo rsync -av $dir/usr/share/fonts/truetype/nerd-fonts/* /usr/share/fonts/truetype/nerd-fonts/
sudo rsync -av $dir/usr/share/icons/* /usr/share/icons/
sudo rsync -av $dir/usr/local/bin/* /usr/local/bin/
sudo rsync -av $dir/.wallpapers/* $home/.wallpapers/
sudo rsync -av $dir/.local/bin/* $home/.local/bin/
sudo rsync -av $dir/.local/share/applications/* $home/.local/share/applications/
sudo rsync -av $dir/.config/* $config/
sudo rsync -av $dir/.Xresources $home/

sudo fc-cache -fv
fc-cache -fv
sudo update-icon-caches /usr/share/icons

# to solve network issue as the wlan0 is owned by wpa_supplicant by default not NetworkManager
sudo systemctl disable wpa_supplicant
sudo rsync -av ./interfaces /etc/network/interfaces
sudo rsync -av ./10-managed.conf /etc/NetworkManager/conf.d/
sudo systemctl restart NetworkManager
sudo nmcli networking off
sudo nmcli networking on

# edit the /etc/default/grub and run the
update-grub

# to set lock screen wallpaper
betterlockscreen -u /home/eren/.wallpapers/evening-sky.png

# curl -sS https://starship.rs/install.sh | sh
