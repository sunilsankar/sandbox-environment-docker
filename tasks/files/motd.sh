###Configure Motd####
USER=`whoami`
HOSTNAME=`uname -n`
MEMORY1=`free -t -m | grep "Mem" | awk '{print $3}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2}'`
LOAD1=`cat /proc/loadavg | awk '{print $1}'`
LOAD5=`cat /proc/loadavg | awk '{print $2}'`
LOAD15=`cat /proc/loadavg | awk '{print $3}'`
echo "
===========================================================================
 - Hostname............: $HOSTNAME
 - Release.............: `cat /etc/redhat-release`
 - Users...............: Currently `users | wc -w` user(s) logged on
===========================================================================
 - Current user........: $USER
 - CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
 - Memory used.........: $MEMORY1 MB / $MEMORY2 MB
 - Swap in use.........: `free -m | tail -n 1 | awk '{print $3}'` MB
===========================================================================
Sandbox Env to test and create ansible roles with molecule and podman
"
