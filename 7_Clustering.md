# Clustering

1. Erstellen Sie ein Cluster mit 3 Nodes

   - VM´s  erstellen/starten
   - RabbitMQ installieren
   - USE_LONGNAME=true konfigurieren um FQDN zu unterstützen
   - Erlang Cookie setzen
   - Cluster in rabbitmq.conf der Node rabbit02 deklarieren
   - Cluster mit rabbit03 über rabbitmqctl beitreten
   - RabbitMQ Service neustarten
   - Cluster Status abrufen

In den nachfolgenden Schritten wird der Ausfall eines Cluster Slaves simuliert:

2. Pausieren Sie Nodes:
   ```
   VBoxmanage list vms
   VBoxManage controlvm rabbit02 pause
   VBoxManage controlvm rabbit02 resume
   ```

3. Frieren Sie die Node ein:
   ```
   VBoxManage controlvm rabbit02 savestate
   VBoxManage startvm rabbit02 --type headless
   ```

4. Fahren Sie Nodes sauber herunter:
   ```
   VBoxManage controlvm rabbit02 acpipowerbutton
   VBoxManage startvm rabbit02 --type headless
   ```

5. Trennen und verbinden Sie die Netzwerkverbindung der VM:
   ```
   VBoxManage constrolvm rabbit02 setlinkstate1 off
   VBoxManage constrolvm rabbit02 setlinkstate2 off
   VBoxManage constrolvm rabbit02 setlinkstate1 on
   VBoxManage constrolvm rabbit02 setlinkstate2 on
   ```

6. Bauen Sie die [Consumer Cancel Notify](https://www.rabbitmq.com/ha.html#cancellation) in Ihren Consumer ein und simulieren Sie einen Failover der Slave, mit der sich der Consumer verbunden hat.

7. Erstellen Sie eine Policy für eine Queue *my_mirrored_queue* und spiegeln diese über alle Cluster Nodes.

8. Verändern Sie den `ha-mode` Policy, so dass nur noch eine Node für als mirror ausgewählt wird.

## Fragen
- Wie verhält sich das Cluster?
- Wie verhält sich das Cluster mit Load?
- Wie verhalten sich verbundene Clients (Publisher und Subscriber)?
- Was zeigt das Log?
- Wie verhalten sich die Queues?
- Sind Messages verloren gegangen?

## Erlang Cookie setzen

```
sudo su -c 'echo DPMDALGUKEOMPTHWPYKC > /var/lib/rabbitmq/.erlang.cookie'
sudo chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
sudo chmod 0600 /var/lib/rabbitmq/.erlang.cookie

sudo service rabbitmq-server restart
```

## Queue Sync Policy
```
rabbitmqctl set_policy ha-all "" '{"ha-mode":"all","ha-sync-mode":"automatic"}'
```

