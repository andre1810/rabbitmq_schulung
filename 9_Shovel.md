# Shovel

1. Installieren Sie das Shovel Plugin und das Shovel Management Plugin.

2. Erstellen Sie einen Static Shovel auf rabbit01, der die Messages einer Queue von rabbit01 in eine Queue auf rabbit03 published.

3. Erstellen Sie einen Static Shovel auf rabbit03, der Messages von einer Queue von rabbit01 abonniert und in eine lokale Queue published.

4. Erstellen Sie einen Dynamic Shovel auf rabbit01, der die Messages einer Queue von rabbit01 in eine Queue auf rabbit03 published.

5. Erstellen Sie einen Static Shovel auf rabbit03, der Messages von einer Queue von rabbit01 abonniert und in eine lokale Queue published.

6. Erstellen Sie einen Dynamic Shovel auf rabbit03, der Messages von einer lokalen Queue in eine andere Lokale Queue sendet.

7. Erstellen Sie einen Dynamic Shovel auf rabbit03, der Messages von einer lokalen Queue in eine  Queue auf rabbit01 sendet.

## Weiterführende Links
- [Erlang Client Referenz](https://www.rabbitmq.com/erlang-client-user-guide.html)
