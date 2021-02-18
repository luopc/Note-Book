shutdown -h now

/sbin/iptables -I INPUT -p tcp --dport 22 -j ACCEPT

firewall-cmd --permanent --add-port=80/tcp 永久开通端口
firewall-cmd --permanent --add-port=22/tcp
firewall-cmd --zone=public --add-port=6379/tcp --permanent

#java
export JAVA_HOME=/opt/public/jdk/jdk1.8.0_161
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib

vim /etc/hosts
192.168.3.110    master
192.168.3.120    server
192.168.3.121    slave1
192.168.3.122    slave2
192.168.3.123    slave3
192.168.3.124    slave4
192.168.3.125    slave5
192.168.3.126    slave6

192.168.3.132    two.slave
192.168.3.133    three.slave

查询tomcat：
ps -fwwu robin | grep apache-tomcat|grep -v grep | grep -v PID | awk '{print $2}' | awk 'NR==1'
停止tomcat: 
ps -fwwu robin | grep apache-tomcat|grep -v grep | grep -v PID | awk '{print $2}' | awk 'NR==1' | xargs kill -15

查询系统在用的端口号
netstat -ntlp | awk -vOFS=":" '/^tcp/ {print $4,$NF}'|awk -F: 'BEGIN{printf "PORT""\t""PID/PROGRAMS""\n"}{printf $(NF - 1)"\t---"$NF"\n"}'|sort -n|uniq

