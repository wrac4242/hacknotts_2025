#!/bin/sh

# chattr, temp

chattr -R -i /home
chattr -R -i /hacknotts
chattr -R -i /var/spool/cron/crontabs

chmod 1777 /tmp
