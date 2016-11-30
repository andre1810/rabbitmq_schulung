# Clustering

1. Erstellen Sie ein Cluster mit 3 Nodes
   - VM erstellen/starten
   - RabbitMQ installieren
   - USE_LONGNAME=true konfigurieren um FQDN zu unterstützen
   - Erlang Cookie setzen
   - RabbitMQ Service neustarten
   - Cluster neustarten

In den nachfolgenden Schritten wird der Ausfall eines Cluster Slaves simuliert:

2. Pausieren Sie Nodes
   ```
   VBoxmanage list vms
   VBoxManage controlvm rabbit02 pause
   VBoxManage controlvm rabbit02 resume
   ```

3. Frieren Sie die Node ein
   ```
   VBoxManage controlvm rabbit02 savestate
   VBoxManage startvm rabbit02 --type headless
   ```

4. Fahren Sie Nodes sauber herunter
   ```
   VBoxManage controlvm rabbit02 acpipowerbutton
   VBoxManage startvm rabbit02 --type headless
   ```

5. Trennen und verbinden Sie die Netzwerkverbindung der VM
   ```
   VBoxManage constrolvm rabbit02 setlinkstate1 off
   VBoxManage constrolvm rabbit02 setlinkstate2 off
   VBoxManage constrolvm rabbit02 setlinkstate1 on
   VBoxManage constrolvm rabbit02 setlinkstate2 on
   ```

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
