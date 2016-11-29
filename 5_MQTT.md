# MQTT

Die von Ihnen konzipierte und aufgebaute Event-Driven-Architektur hat sich als sehr passend für Ihre erwiesen. Auch andere Abteilungen nehmen diese wahr und möchten nun von Messaging profitieren. Ein neues IoT Projekt im Unternehmen soll nun RabbitMQ mit dem MQTT Protokoll nutzen.

1. Erstellen Sie einen `MqttProducer` als Konsolenanwendung. Die Anwendung soll Temperatursensoren in Ihrem Bürogebäude simulieren und in einem Intervall zufällige Temperaturen zwischen 16 und 26 Grad Celsius publishen.

  Dabei soll ein zufälliger Standort, eine Etage (1-3) und ein Raum (1-20) das `Topic` definieren. Topic Hierachie: `<Standort>/<Etage>/<RaumNr>/Temperatur`

  Die Message soll als `Retained Message` gesetzt werden.

2. Erstellen Sie einen `MqttSiteConsumer`, der alle Temperatur-Events Ihres Standorts abonniert und auf der Konsole ausgibt.

3. Erstellen Sie einen `MqttAlarmConsumer`, der alle Temperatur-Events des Bus abonniert und auf der Konsole ausgibt.

## Weiterführende Links
- [eclipse Paho mqtt Client](http://www.eclipse.org/paho/)
- [php mqtt Client](https://github.com/bluerhinos/phpMQTT)
- [paho-mqtt python Client](https://pypi.python.org/pypi/paho-mqtt/1.2)
