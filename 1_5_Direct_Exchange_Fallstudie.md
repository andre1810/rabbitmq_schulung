# Direct Exchange

Ihr Unternehmen bietet eine Webanwendung als Software-as-a-Service mit Abonnement-Modell an. Die Abrechnung wird von einer Applikation durchgeführt. Anschließend wird eine Rechnung als PDF erzeugt und per Email oder per Post versendet. Die Anwendung ist gewachsen und lässt sich immer aufwändiger warten/aktualisieren. Zusätzlich sollen in Zukunft weitere Transportwege (Online Archiv, ...) unterstützt werden.

Ihre Aufgabe ist nun, das Versenden der Rechnung per Email und per Post in zwei Anwendungen zu extrahieren und über RabbitMQ mit AMQP abzubilden.

1. Entwickeln Sie einen Consumer/Subscriber bzw. `PdfInvoiceSubscriber` als Konsolenapplikation. Dieser soll die Queue mit den Anfragen zum Rechnungsversandt abonnieren. In der ersten Version Ihrer Anwendung soll beim Eintreffen einer Message die Kundennummer und die Emailadresse angezeigt werden.

2. Entwickeln Sie einen Consumer/Subscriber bzw. `PrintInvoiceSubscriber` als Konsolenapplikation. Dieser soll die Queue mit den Anfragen zum Rechnungsversandt abonnieren. In der ersten Version Ihrer Anwendung soll beim Eintreffen einer Message die Kundennummer und die Rechnungsadresse des Kunden angezeigt werden.

3. Entwickeln Sie einen `SendInvoicePublisher` als Konsolenapplikation. Die Anwendung soll in einem Intervall zufällige SendInvoiceRequests senden.

4. Starten Sie die Anwendungen

## Rahmenbedingungen

- Entwickeln Sie in Ihrer bevorzugten Programmiersprache.
- Notwendige Ressourcen auf dem RabbitMQ Broker werden von den Anwendungen angelegt, wenn Sie noch nicht vorhanden sind.

## SendInvoiceRequest Format

Ein *SendInvoiceRequest* ist nach folgendem Schema aufgebaut:

Bei Versandt per PDF:
`SendInvoiceRequestId|CustomerId|InvoiceId|CustomerEmail`

Bei Versandt per Post:
`SendInvoiceRequestId|CustomerId|InvoiceId|Salutation|FirstName|LastName|Address|ZipCode|City|Country`
