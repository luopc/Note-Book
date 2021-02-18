#!/bin/bash 

#under /etc/cron.daily
thedate='date--rfc-339=date'
predate='date+%Y-%m-%d --date="-7 day"'

rmfile="/opt/box/apps/robin/tomcat/apache-tomcat-9.0.43/logs/catalina-daemon.${predate}.out"
outfile="/opt/box/apps/robin/tomcat/apache-tomcat-9.0.43/logs/catalina-daemon.out"
if[ -f $rmfile}];then
    rm -f $rmfile}
fi

if[ -f ${outfile}];then
    cp ${outfile}  /opt/box/apps/robin/tomcat/apache-tomcat-9.0.43/logs/catalina-daemon.${thedate}.out
    echo "" > ${outfile}
fi

exit 0