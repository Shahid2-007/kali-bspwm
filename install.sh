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
  pkg-config systemd ripgrep fakeroot base-files dbus-x11 flameshot lxappearance openvpn pkexec arch-install-scripts

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
sudo cp $dir/usr/share/fonts/truetype/nerd-fonts/* /usr/share/fonts/truetype/nerd-fonts/
sudo cp -r $dir/usr/share/icons/* /usr/share/icons/
sudo cp $dir/usr/local/bin/* /usr/local/bin/
sudo cp $dir/.wallpapers/* $home/.wallpapers/
sudo cp $dir/.local/bin/* $home/.local/bin/
sudo cp $dir/.local/share/applications/* $home/.local/share/applications/
sudo cp -r $dir/.config/* $config/
sudo cp $dir/.Xresources $home/

sudo fc-cache -fv
fc-cache -fv
sudo update-icon-caches /usr/share/icons

# curl -sS https://starship.rs/install.sh | sh
