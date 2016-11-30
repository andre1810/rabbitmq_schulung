# monit

1. Monit installieren:
   ```
   apt-get install monit
   ```

2. `/etc/monit/monitrc` editieren:
   ```
   set httpd port 2812 and
     use address 192.168.33.101
     allow admin:monit
   ``

3. `/etc/monit/conf.d/rabbitmq` erstellen:
   ```
   CHECK PROCESS rabbitmq-server WITH PIDFILE /var/run/rabbitmq/pid
     GROUP rabbitmq
     START PROGRAM "/usr/sbin/service rabbitmq-server start"
     STOP PROGRAM "/usr/sbin/service rabbitmq-server stop"
     IF DOES NOT EXIST FOR 3 CYCLES THEN RESTART
     IF FAILED PORT 5672 4 TIMES WITHIN 6 CYCLES THEN RESTART
   ```

4. monit neustarten: `/etc/init.d/monit restart`

5. [http://rabbit01.vagrant.test:2812/](http://rabbit01.vagrant.test:2812/)
   - Status Übersicht
   - admin:monit
