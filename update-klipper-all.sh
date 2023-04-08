cd ~/klipper

echo -e -n "\e[0;31mStopping Klipper Service. "
echo -e -n '\e[0;0m'

sudo systemctl stop klipper
sudo systemctl status klipper

git pull


# Flash main MCU - BTT SKR Mini E3 V3
make clean KCONFIG_CONFIG=klipper-btt-skr-mini-e3-v3.config
make menuconfig KCONFIG_CONFIG=klipper-btt-skr-mini-e3-v3.config
make KCONFIG_CONFIG=klipper-btt-skr-mini-e3-v3.config

echo -e -n "\e[0;33mBTT SKR Mini E3 v3.0 MCU firmware built, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32g0b1xx_2E000D001850425938323120-if00 KCONFIG_CONFIG=klipper-btt-skr-mini-e3-v3.config
echo -e -n "\e[0;33mBTT SKR Mini E3 v3.0 MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

# Flash Host MCU - Raspberry Pi
make clean KCONFIG_CONFIG=klipper-raspberry-pi.config
make menuconfig KCONFIG_CONFIG=klipper-raspberry-pi.config
make KCONFIG_CONFIG=klipper-raspberry-pi.config

echo -e -n "\e[0;33mRaspberry Pi MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

make flash KCONFIG_CONFIG=klipper-raspberry-pi.config

echo -e -n "\e[0;33mRaspberry Pi MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

echo -e -n "\e[0;32mStarting Klipper Service."
echo -e -n '\e[0;0m'
sudo systemctl start klipper
sudo systemctl status klipper

exit
