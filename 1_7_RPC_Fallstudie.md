# RPC

Sie haben das Versenden von Emails und Benachrichtigung Ihrer Kunden mit dem Message Bus/RabbitMQ abgebildet. Eine Ihrer Komponenten benötigt eine Rückmeldung über den Status der Benachrichtigung.

1. Entwickeln Sie einen `NotificationRpcServer` als Konsolenapplikation. Bei eingehenden RPC Requests soll die Correlation Id des Requests, eine UUID (Simulation des Ergebnis eines simulierten Email Servers) generiert und als RPC Response zurückgegeben werden.

2. Entwickeln Sie einen `NotificationRpcClient`. Verwenden Sie die `reply-to` Queue von RabbitMQ um RPC Requests an den Server zu senden. Bei erfolgreichem RPC Request soll die UUID auf der Konsole ausgegeben werden.

3. Erweitern Sie den `NotificationRpcServer`: Simulieren Sie einen Ausfall des Email-Servers und geben Sie eine Fehlermeldung im Response zurück. Nutzen Sie einen RPC Status im Message Header der RPC Response.

## Fragen:
- Wie kann ein RPC Server mehrere unterschiedliche RPC Requests verarbeiten? Wie können diese vom Typ unterschieden werden?
- Welchen Nachteil hat die `reply-to` Queue? Was wäre eine alternative Lösung?
