#!/sbin/runscript

PIDFILE=/var/run/meresco-harvester.pid

depend() {
 need net
}

start() {
    ebegin "Starting meresco-harvester"
	start-stop-daemon --start --quiet --background\
	--pidfile ${PIDFILE} \
	--chuid ${HARVEST_USER}:${HARVEST_GROUP} \
	--exec /usr/bin/python /var/lib/meresco-harvester/startharvester.py \
	    -- ${HARVESTOPTS}
    eend $?
}

stop() {
    ebegin "Stopping meresco-harvester"
	start-stop-daemon --stop --quiet --pidfile ${PIDFILE}
    eend $?
}
