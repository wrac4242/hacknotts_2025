#!/bin/sh

# chattr, temp

chattr -R +i /home
chattr -R +i /hacknotts
chattr -R +i /var/spool/cron/crontabs

chmod o-r /tmp
