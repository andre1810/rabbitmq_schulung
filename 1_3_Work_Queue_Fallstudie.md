# Work Queue Fallstudie

Sie betreiben ein Backend-System (REST API) für eine Smartphone App, in der Sie Nutzer über neue Ereignisse per Email oder SMS benachrichtigen. Der Aufruf zum Versand einer Benachrichtigung wird aktuell synchron im Code durchgeführt, wenn diese versendet werden soll. Aufgrund einer innovativen Marketingaktion wird Ihr Unternehmen über Nacht sehr bekannt und die App Downloads schnellen in die Höhe. Die Anfragen an Ihr System steigen und die Antwortzeiten werden immer länger. Das Benachrichtigen führt zu Zeitüberschreitungen und somit zu Fehlermeldungen in der App.

Ihre Aufgabe ist nun, das Versenden der Benachrichtigungen aus der bestehenden Anwendung zu extrahieren und über RabbitMQ mit AMQP abzubilden.

1. Entwickeln Sie einen Consumer/Subscriber bzw. `CustomerNotificationWorker` als Konsolenapplikation. Dieser soll die Queue mit den Benachrichtigungen abonnieren. In der ersten Version Ihrer Anwendung soll beim Eintreffen einer Message  der Text der Customer Notification sowie die Id, der Name und die Email des zu benachrichtigenden Nutzers ausgegben werden.

2. Entwickeln Sie einen `CustomerNotificationPublisher` als Konsolenapplikation. Die Anwendung soll in einem Intervall einen zufälligen Nutzer mit eine zufällige Benachrichtigung senden.

3. Starten Sie die Anwendungen

- mit nur einem `CustomerNotificationSubscriber`
- mit mehreren `CustomerNotificationSubscriber`
  - Stellen Sie die Anwendung um, so dass immer jeweils nur eine Notification bei einem Subscriber ankommt und diese so im round-robin Modus verteilt werden.

## Rahmenbedingungen

- Entwickeln Sie in Ihrer bevorzugten Programmiersprache.
- Notwendige Ressourcen auf dem RabbitMQ Broker werden von den Anwendungen angelegt, wenn Sie noch nicht vorhanden sind.

## CustomerNotification Format

Eine *Notification* ist nach folgendem Schema aufgebaut:

`UserId|UserFullname|UserEmail|CustomerNotificationNr[CustomerNotification`

Die CustomerNotificationNr ist eine Sequenznummer und soll bei jeder Nachricht inkrementiert werden.

**Beispiel:**

`1|André Hester|mail@no-spam.de|1|Testbenachrichtigung`

## Weitere Links

- [php-amqplib](https://github.com/php-amqplib/php-amqplib)
- [RabbitMQ Java Client](https://www.rabbitmq.com/java-client.html)
- [node-amqp](https://github.com/squaremo/amqp.node)
