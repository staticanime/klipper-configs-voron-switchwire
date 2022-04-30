sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.skr
#make menuconfig KCONFIG_CONFIG=config.skr
make KCONFIG_CONFIG=config.skr
read -p "SKR Mini E3 V2.0 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

./scripts/flash-sdcard.sh /dev/ttyACM0 btt-skr-mini-e3-v2
read -p "SKR Mini E3 V2.0 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi

make KCONFIG_CONFIG=config.rpi
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=config.rpi

sudo service klipper start
