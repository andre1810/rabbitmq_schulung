# Topic Exchange

Sie betreiben in Ihrem Unternehmen ein Kundenportal basierend auf einer Microservice-Architektur, die aus mehreren unabhängigen Microservices besteht. Die Microservices loggen Ihre Ereignisse aktuell in lokale Textfiles.

Ihre Aufgabe ist nun, den Logger zu erweitern und das Versenden der Logs über RabbitMQ mit AMQP abzubilden.

1. Entwickeln Sie einen Consumer/Subscriber bzw. `InfoLogSubscriber` als Konsolenapplikation. Dieser soll Logs ausgeben, die mit der Stufe "info" gesendet wurden.

2. Entwickeln Sie einen Consumer/Subscriber bzw. `ErrorSubscriber` als Konsolenapplikation. Dieser soll alle Error Logs ausgeben, die gesendet wurden.

3. Entwickeln Sie einen Consumer/Subscriber bzw. `AllLogLevelsSubscriber` als Konsolenapplikation. Dieser soll alle Logs ausgeben, die gesendet wurden.

4. Entwickeln Sie einen `LogPublisher` als Konsolenapplikation. Die Anwendung soll in einem Intervall zufällig generierte Logs senden.

5. Ihr Unternehmen wächst international sehr stark und Sie richten dedizierte Support Teams ein. Im ersten Schritt starten Sie mit Europa und USA. Erweitern Sie das Logging um Angabe der Region.
  - der ErrorLogger soll weiterhin nur die Errors loggen
  - der AllLogLevelsSubscriber soll alle Events empfangen
  - den InfoLogSubscriber ändern Sie dahingehend ab, dass Sie beim Starten der Anwendung die Länderkennung festlegen können (Environment Variable oder zwei Applikationen mit fest kodierter Länderkennung)

  ## Rahmenbedingungen

  - Entwickeln Sie in Ihrer bevorzugten Programmiersprache.
  - Notwendige Ressourcen auf dem RabbitMQ Broker werden von den Anwendungen angelegt, wenn Sie noch nicht vorhanden sind.
