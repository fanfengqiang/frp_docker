#!/bin/sh


echo """
[common]
bind_addr = 0.0.0.0
bind_port = ${PORT-"7000"}

# set dashboard_addr and dashboard_port to view dashboard of frps
# dashboard_addr's default value is same with bind_addr
# dashboard is available only if dashboard_port is set
dashboard_addr = 0.0.0.0
dashboard_port = ${ADMIN_PORT-"7500"}

# dashboard user and passwd for basic auth protect, if not set, both default value is admin
dashboard_user = ${ADMIN_USER-"admin"}
dashboard_pwd = ${ADMIN_PWD-"admin"}

# console or real logFile path like ./frps.log
log_file = /var/log/frps.log

# trace, debug, info, warn, error
log_level = info

log_max_days = 3

# auth token
token = ${TOKEN-"12345678"}
""" > /etc/frps.ini

sleep 1

exec $@
