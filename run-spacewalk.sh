#!/bin/bash

sed -i 's/shared_buffers = 384MB/shared_buffers = 100MB/g' /var/lib/pgsql/data/postgresql.conf
sysctl -w kernel.shmmax=134217728

exec supervisord -c /etc/supervisor/conf.d/supervisord.conf

