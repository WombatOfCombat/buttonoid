# buttonoid

A plasma 6 configurable button widget that allows the user to set a transparent png to activate a bash command on-click.

![screenshot](screenshots/example1.png)

![screenshot](screenshots/example4.png)

## dependancies:
may help during installation
```
sudo pacman -S plasma-sdk        # Arch/CachyOS/Manjaro
sudo dnf install plasma-sdk      # Fedora
sudo apt install plasma-sdk      # Debian/Ubuntu/KDE neon
```

## installation:
run in bash
```
git clone https://github.com/wombatOfCombat/buttonoid ~/buttonoid
cd buttonoid
kpackagetool6 -t Plasma/Applet -i package
plasmashell --replace &
``` 