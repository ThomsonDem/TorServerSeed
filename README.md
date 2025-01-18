# TorServerSeed - Tor Hidden Service Setup

TorServerSeed è uno script semplice per configurare e avviare un servizio nascosto Tor che utilizza Apache2 per il web hosting. Lo script automatizza l'installazione dei pacchetti necessari e la configurazione dei servizi per creare un link `.onion`.

## Funzionalità
- Installa e configura Tor e Apache2.
- Crea un servizio nascosto per HTTP (porta 80).
- Permette la configurazione dinamica dell'indirizzo IP.
- Mostra automaticamente il link `.onion`.

## Requisiti
- Una macchina Linux con supporto per `apt`.
- Permessi di root o accesso con `sudo`.

## Installazione

1. Clona il repository:
   ```bash
   git clone https://github.com/your-repo-name/tor-server-seed.git
   cd tor-server-seed
   ```

2. Esegui lo script:
   ```bash
   sudo bash setup.sh
   ```

3. Segui le istruzioni a schermo per inserire l'indirizzo IP (es. `127.0.0.1` per localhost).

## Come usare

- Controlla lo stato dei servizi:
  ```bash
  cat /home/statusapache.txt
  cat /home/statustor.txt
  ```

- Ottieni il tuo link `.onion`:
  ```bash
  cat /var/lib/tor/hidden_service/http/hostname
  ```

- Accedi al link `.onion` tramite un browser Tor.

## Risoluzione dei problemi

- Controlla i log dei servizi in caso di errori:
  ```bash
  journalctl -u apache2
  journalctl -u tor
  ```

- Assicurati che la configurazione del file `/etc/tor/torrc` sia corretta:
  ```text
  HiddenServiceDir /var/lib/tor/hidden_service/http
  HiddenServicePort 80 127.0.0.1
  ```

- Se il file `hostname` non viene generato:
  1. Controlla che la directory `/var/lib/tor/hidden_service/http` esista e abbia i permessi corretti.
  2. Riavvia il servizio Tor:
     ```bash
     sudo systemctl restart tor
     ```

## Contribuzione
Contribuzioni, fork e pull request sono sempre benvenuti!

## Licenza
Questo progetto è distribuito sotto licenza MIT.

