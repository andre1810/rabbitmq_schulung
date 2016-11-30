# Federation

1. Installieren Sie das Federation Plugin und Federation Managagement Plugin auf allen Nodes.

2. Lösen Sie die Node rabbit03 aus Ihrem Cluster und betreiben Sie diesen als einzelne Node.

3. Erstellen Sie eine Federated Queue auf rabbit03 mit Upstream auf dem Cluster. Nutzen Sie den Producer aus der 1. Fallstudie um Nachrichten in die Queue auf rabbit01 oder rabbit02 zu senden.
Komsumieren Sie die Queue auf rabbit03 mit de zugehörigen Consumer.

4. Leiten Sie die Nachrichten eines beliebigen Exchanges vom Cluster (rabbit01, rabbit02) an einen Federated Exchange auf rabbit03 weiter. Nutzen Sie den Producer aus der 2. Fallstudie um Nachrichten gegen den Exchange auf rabbit01 zu senden. Konsumieren Sie die Nachrichten mit dem zugehörigen Consumer von einer Queue auf rabbit03, die sich gegen den Exchange bindet.
