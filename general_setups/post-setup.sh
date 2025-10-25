#!/bin/sh

# chattr, temp

chattr -R +i /home
chattr -R +i /hacknotts

chmod o-r /tmp
