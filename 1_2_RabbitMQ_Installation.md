# RabbitMQ Installation

```
echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install erlang-nox init-system-helpers rabbitmq-server --yes
```

# RabbitMQ Management/Web UI aktivieren

```
sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart
```

# guest User für Web UI aktivieren

```
sudo su -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config
sudo service rabbitmq-server restart
```

- URL:      http://rabbit01.vagrant.test:15672
- Login:    guest
- Passwort: guest

# Config Template
- Alte Struktur
https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/stable/docs/rabbitmq.config.example
- Neue Struktur (ab 3.7.0)
https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/master/docs/rabbitmq.conf.example
https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/master/docs/advanced.config.example
