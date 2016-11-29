# Publish/Subscribe

Sie betreiben in Ihrem Unternehmen einen Webshop mit einer Microservice-Architektur, die aus mehreren unabhängigen Microservices besteht. Die Microservices fragen Änderungen bzw. Ereignisse periodisch bei den anderen Services ab, um zu erfahren, ob bestimmte Ereignisse geschehen sind, wie z.B. die Anlage eines Neukunden, Kauf eines Produktes und weitere Events. Durch das Pollen der Services entsteht viel Last im Netzwerk und bei den Services. Zusätzlich entsteht viel Konfigurationsaufwand durch die Definition der Abhängigkeiten zu anderen Services.

Ihre Aufgabe ist nun, das Pollen der Anwendungen auf Messaging umzustellen und über RabbitMQ mit AMQP abzubilden, so dass die Konfiguration entfällt und nur Last entsteht, wenn auch Ereignisse aufgetreten sind.

1. Entwickeln Sie einen Consumer/Subscriber bzw. `ProductCatalogSubscriber` als Konsolenapplikation. Dieser soll die Queue mit den Benachrichtigungen abonnieren. In der ersten Version Ihrer Anwendung soll beim Eintreffen einer Message die Id der betreffenden Ressource, der Event Name sowie die Properties angezeigt werden.

2. Entwickeln Sie einen Consumer/Subscriber bzw. `CheckoutSubscriber` als Konsolenapplikation. Dieser soll die Queue mit den Benachrichtigungen abonnieren. In der ersten Version Ihrer Anwendung soll beim Eintreffen einer Message die Id der betreffenden Ressource, der Event Name sowie die Properties angezeigt werden.

3. Entwickeln Sie einen Consumer/Subscriber bzw. `CustomerProfileSubscriber` als Konsolenapplikation. Dieser soll die Queue mit den Benachrichtigungen abonnieren. In der ersten Version Ihrer Anwendung soll beim Eintreffen einer Message die Id der betreffenden Ressource, der Event Name sowie die Properties angezeigt werden.

4. Entwickeln Sie einen `WebShopEventPublisher` als Konsolenapplikation. Die Anwendung soll in einem Intervall zufällige Events senden.

5. Starten Sie die Anwendungen

6. Stoppen Sie einen beilieben Subscriber
  - Stellen Sie die Anwendung um, so dass die ShopEvents auf dem RabbitMQ Server vorgehalten werden, wenn der Subscriber nicht verbunden ist und die Nachrichten dann wieder konsumiert werden, wenn die Anwendung/der Subscriber wieder startet.

## Rahmenbedingungen

- Entwickeln Sie in Ihrer bevorzugten Programmiersprache.
- Notwendige Ressourcen auf dem RabbitMQ Broker werden von den Anwendungen angelegt, wenn Sie noch nicht vorhanden sind.

## ShopEvent Format

Ein *WebshopEvent* ist nach folgendem Schema aufgebaut:

`WebshopEventNr|WebshopEventId|ResourceName|EventName|EventData`

Die WebshopEventNr ist eine Sequenznummer und soll bei jeder Nachricht inkrementiert werden.

**WebshopEventId** = Zufällige ID

**ResourceName** = customer, supplier, invoice, credit, product

**EventName:**
- **Customer:** added, updated, deleted
- **Supplier:** added, updated, deleted
- **Invoice:** created, cancelled
- **Credit:** created, cancelled
- **Product:** created, updated, deleted, out_of_stock, quantity_changed

**EventData** = Key-Value Liste im Format `Key=Value;`

Kann weitere Informationen zur Ressource enthalten, wie z.B. changed_attribute, new_attribute_value, new_quantity, ...


**Beispiel:**

`1|1|customer|added|customer_email=info@no-spam.com`
`2|30|product|quantity_changed|old_quantity=15;new_quantity=20`
