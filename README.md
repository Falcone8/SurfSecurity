# SurfSecurity

## Breve introduzione
Surf Security aiuta le persone ad amministrare i propri gruppi e include molti altri strumenti utili.

* * *

## Impostare

** Prima di tutto, dai un'occhiata alle impostazioni del tuo bot **

> * Assicurati che la privacy sia disabilitata (maggiori informazioni possono essere trovate andando alla [pagina ufficiale Bots FAQ] (https://core.telegram.org/bots/faq#what-messages-will-my-bot-get) ). Invia `/ setprivacy` a [@BotFather] (http://telegram.me/BotFather) per controllare lo stato corrente di questa impostazione.

** Crea un file di testo semplice denominato `.env` con quanto segue: **

> * Imposta `TG_TOKEN` sul token di autenticazione ricevuto da [` @ BotFather`] (http://telegram.me/BotFather).
>
> * Imposta `SUPERADMINS` come un array JSON contenente il tuo ID Telegram numerico. Possono essere aggiunti anche altri superadmin. È importante inserire l'ID numerico e NON una stringa.
>
> * Imposta `LOG_CHAT` (l'ID della chat dove il bot invierà tutte le cattive richieste ricevute da Telegram) e il tuo` LOG_ADMIN` (l'ID dell'utente che riceverà gli errori di esecuzione).

Il tuo file `.env` dovrebbe ora assomigliare a questo:

`` `
TG_TOKEN = 123456789: ABCDefGhw3gUmZOq36-D_46_AMwGBsfefbcQ
SUPERADMINS = [12345678]
LOG_CHAT = 12345678
LOG_ADMIN = 12345678
`` `


## Setup (utilizzando Docker)
Requisiti:

- docker 18.02.0-ce
- docker-compose 1.21.0
- Opzionale: cluster Docker Swarm per la distribuzione

### Running (modalità dev)
Esegui `make dev_polling`. Docker estrae e costruisce le immagini richieste, quindi la prima volta che esegui questo comando dovrebbe richiedere un po 'di tempo. Dopodiché, il bot dovrebbe essere attivo e funzionante.

Il codice è montato sul contenitore del bot, quindi puoi apportare modifiche e riavviare il bot come faresti normalmente.

La porta predefinita di Redis è montata sull'host, nel caso in cui si desideri eseguire il debug di qualcosa utilizzando gli strumenti disponibili sull'host.

** Il contenitore redis è impostato per non rendere persistenti i dati in modalità sviluppatore **.

### Running (modalità di produzione)
Esistono diversi modi per utilizzare la finestra mobile per la distribuzione in produzione.

I file denominati `docker-compose. *. Yml` sono gitignored, nel caso in cui si senta la necessità di sovrascrivere` docker-compose.yml` o scrivere qualcos'altro interamente.

Il bot supporta anche la lettura di Docker Secrets (può funzionare anche con altri vault). Controlla `lua / config.lua` per vedere quali variabili possono essere lette dai segreti.

#### Componi Esempio

Puoi distribuire Surf Security eseguendo:

`make easy_deploy`


#### Esempio di sciame
Supponendo che tu abbia distribuito redis, ad esempio `staging` (` docker stack deploy ... `o` docker service create ... `) ed esportato le variabili di ambiente richieste (come` $ TG_TOKEN` ...), puoi distribuire Surf Security eseguendo:

`docker stack deploy staging -c docker-compose.yml`

## Configurazione (senza utilizzare Docker)
Elenco dei pacchetti richiesti:
- `libreadline-dev`
- `redis-server`
- "lua5.1"
- `liblua5.1dev`
- `libssl-dev`
- "git"
- "make"
- "unzip"
- "curl"
- `libcurl4-gnutls-dev`

Avrai bisogno anche di altri moduli Lua, che possono essere (e dovrebbero essere) installati tramite il gestore di pacchetti Lua LuaRocks.

**Installazione**

Puoi installare facilmente Surf Security eseguendo i seguenti comandi:

`` bash
# Testato su Ubuntu 16.04

$ wget https://github.com/Falcone8/SurfSecurity/blob/master/install.sh
$ bash install.sh
`` `

o

`` bash
# Testato su Ubuntu 14.04, 15.04 e 16.04, Debian 7, Linux Mint 17.2

$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install libreadline-dev libssl-dev lua5.1 liblua5.1-dev git make unzip redis-server curl libcurl4-gnutls-dev

# Adesso installeremo LuaRocks e i moduli Lua richiesti

$ wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
$ tar zxpf luarocks-2.2.2.tar.gz
$ cd luarocks-2.2.2
$ ./configure; sudo make bootstrap
$ sudo luarocks install luasec
$ sudo luarocks install luasocket
$ sudo luarocks install redis-lua
$ sudo luarocks install lua-term
$ sudo luarocks install serpent
$ sudo luarocks install lua-cjson
$ sudo luarocks installa Lua-cURL
$ cd ..

Prima di avviare il bot, devi avviare il processo Redis.

`` bash
# Avvia Redis

$ sudo service redis-server start
`` `

## Avvio del processo

Per avviare il bot, esegui `. / Launch.sh`. Per arrestare il bot, premi due volte Control <kbd> CTRL </kbd> + <kbd> C </kbd>.

Puoi anche avviare il bot con `. / Polling.lua`, tuttavia non si riavvierà automaticamente. Dovrai anche trovare un altro modo per esportare le variabili di ambiente richieste.

* * *
## Qualcosa che dovresti sapere prima di eseguire il bot

* Puoi modificare alcune impostazioni del bot. Tutte le impostazioni sono collocate in `config.lua`, nella tabella` bot_settings`
* `cache_time.adminlist`: la permanenza in secondi dell'adminlist nella cache. Il bot memorizza nella cache la lista di amministrazione per evitare di raggiungere i limiti di Telegram
* `notify_bug`: se` true`, il bot invierà un messaggio che notifica che si è verificato un bug all'utente corrente, quando viene eseguito un plugin e si verifica un errore
* `log_api_errors`: se` true`, il bot sen
* * *

## Impostare

** Prima di tutto, dai un'occhiata alle impostazioni del tuo bot **

> * Assicurati che la privacy sia disabilitata (maggiori informazioni possono essere trovate andando alla [pagina ufficiale Bots FAQ] (https://core.telegram.org/bots/faq#what-messages-will-my-bot-get) ). Invia `/ setprivacy` a [@BotFather] (http://telegram.me/BotFather) per controllare lo stato corrente di questa impostazione.

** Crea un file di testo semplice denominato `.env` con quanto segue: **

> * Imposta `TG_TOKEN` sul token di autenticazione ricevuto da [` @ BotFather`] (http://telegram.me/BotFather).
>
> * Imposta `SUPERADMINS` come un array JSON contenente il tuo ID Telegram numerico. Possono essere aggiunti anche altri superadmin. È importante inserire l'ID numerico e NON una stringa.
>
> * Imposta `LOG_CHAT` (l'ID della chat dove il bot invierà tutte le cattive richieste ricevute da Telegram) e il tuo` LOG_ADMIN` (l'ID dell'utente che riceverà gli errori di esecuzione).

Il tuo file `.env` dovrebbe ora assomigliare a questo:

`` `
TG_TOKEN = 123456789: ABCDefGhw3gUmZOq36-D_46_AMwGBsfefbcQ
SUPERADMINS = [12345678]
LOG_CHAT = 12345678
LOG_ADMIN = 12345678
`` `


## Setup (utilizzando Docker)
Requisiti:

- docker 18.02.0-ce
- docker-compose 1.21.0
- Opzionale: cluster Docker Swarm per la distribuzione

### Running (modalità dev)
Esegui `make dev_polling`. Docker estrae e costruisce le immagini richieste, quindi la prima volta che esegui questo comando dovrebbe richiedere un po 'di tempo. Dopodiché, il bot dovrebbe essere attivo e funzionante.

Il codice è montato sul contenitore del bot, quindi puoi apportare modifiche e riavviare il bot come faresti normalmente.

La porta predefinita di Redis è montata sull'host, nel caso in cui si desideri eseguire il debug di qualcosa utilizzando gli strumenti disponibili sull'host.

** Il contenitore redis è impostato per non rendere persistenti i dati in modalità sviluppatore **.

### Running (modalità di produzione)
Esistono diversi modi per utilizzare la finestra mobile per la distribuzione in produzione.

I file denominati `docker-compose. *. Yml` sono gitignored, nel caso in cui si senta la necessità di sovrascrivere` docker-compose.yml` o scrivere qualcos'altro interamente.

Il bot supporta anche la lettura di Docker Secrets (può funzionare anche con altri vault). Controlla `lua / config.lua` per vedere quali variabili possono essere lette dai segreti.

#### Componi Esempio

Puoi distribuire Surf Security eseguendo:

`make easy_deploy`


#### Esempio di sciame
Supponendo che tu abbia distribuito redis, ad esempio `staging` (` docker stack deploy ... `o` docker service create ... `) ed esportato le variabili di ambiente richieste (come` $ TG_TOKEN` ...), puoi distribuire Surf Security eseguendo:

`docker stack deploy staging -c docker-compose.yml`

## Configurazione (senza utilizzare Docker)
Elenco dei pacchetti richiesti:
- `libreadline-dev`
- `redis-server`
- "lua5.1"
- `liblua5.1dev`
- `libssl-dev`
- "git"
- "make"
- "unzip"
- "curl"
- `libcurl4-gnutls-dev`

Avrai bisogno anche di altri moduli Lua, che possono essere (e dovrebbero essere) installati tramite il gestore di pacchetti Lua LuaRocks.

**Installazione**

Puoi installare facilmente Surf Security  eseguendo i seguenti comandi:

`` bash
# Testato su Ubuntu 16.04

$ wget https://github.com/Falcone8/SurfSecurity/blob/master/install.sh
$ bash install.sh
`` `

o

`` bash
# Testato su Ubuntu 14.04, 15.04 e 16.04, Debian 7, Linux Mint 17.2

$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install libreadline-dev libssl-dev lua5.1 liblua5.1-dev git make unzip redis-server curl libcurl4-gnutls-dev

# Adesso installeremo LuaRocks e i moduli Lua richiesti

$ wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
$ tar zxpf luarocks-2.2.2.tar.gz
$ cd luarocks-2.2.2
$ ./configure; sudo make bootstrap
$ sudo luarocks install luasec
$ sudo luarocks install luasocket
$ sudo luarocks install redis-lua
$ sudo luarocks install lua-term
$ sudo luarocks install serpent
$ sudo luarocks install lua-cjson
$ sudo luarocks installa Lua-cURL
$ cd ..

# Clona il repository e concedi allo script di avvio le autorizzazioni da eseguire
# Se vuoi clonare il ramo beta, usa git clone con l'opzione [-b beta]

$ git clone https://github.com/Falcone8/SurfSecurity.git
$ cd GroupButler
$ sudo chmod + x launch.sh
`` `

Prima di avviare il bot, devi avviare il processo Redis.

`` bash
# Avvia Redis

$ sudo service redis-server start
`` `

## Avvio del processo

Per avviare il bot, esegui `. / Launch.sh`. Per arrestare il bot, premi due volte Control <kbd> CTRL </kbd> + <kbd> C </kbd>.

Puoi anche avviare il bot con `. / Polling.lua`, tuttavia non si riavvierà automaticamente. Dovrai anche trovare un altro modo per esportare le variabili di ambiente richieste.

* * *
## Qualcosa che dovresti sapere prima di eseguire il bot

* Puoi modificare alcune impostazioni del bot. Tutte le impostazioni sono collocate in `config.lua`, nella tabella` bot_settings`
* `cache_time.adminlist`: la permanenza in secondi dell'adminlist nella cache. Il bot memorizza nella cache la lista di amministrazione per evitare di raggiungere i limiti di Telegram
* `notify_bug`: se` true`, il bot invierà un messaggio che notifica che si è verificato un bug all'utente corrente, quando viene eseguito un plugin e si verifica un errore
* `log_api_errors`: se` true`, il bot send in `LOG_CHAT` tutti gli errori rilevanti restituiti da una richiesta API verso Telegram
* `stream_commands`: se` true`, quando un aggiornamento attiva un plugin, la corrispondenza verrà stampata sulla console
* Ci sono altri campi utili che possono essere aggiunti a .env che puoi trovare in `config.lua`, per esempio
* `REDIS_DB`: il database Redis selezionato (se stai utilizzando Redis con la configurazione predefinita, i database disponibili sono 16). Il database verrà selezionato ad ogni avvio / ricaricamento. Predefinito: 0
* Altre cose che possono essere utili
* I comandi degli amministratori iniziano per "$". Non sono documentati, guarda i trigger del plugin `plugins / admin.lua` per l'intero elenco
* Se la funzione principale di un plugin restituisce "true", il bot continuerà a cercare di far corrispondere il testo del messaggio con i trigger mancanti della tabella "plugins"
* Puoi inviarti un backup della cartella del bot zippato con il comando "$ backup"
* L'API Bot di Telegram ha alcuni "comportamenti strani" non documentati che potresti notare durante l'utilizzo di questo bot
* Nei supergruppi, il metodo `kickChatMember` restituisce sempre una risposta positiva se` user_id` ha fatto parte del gruppo almeno una volta, non importa se l'utente non è nel gruppo quando usi questo metodo
* Nei supergruppi, il metodo `unbanChatMember` restituisce sempre una risposta positiva se` user_id` ha fatto parte del gruppo almeno una volta, non importa se l'utente non è nel gruppo o non è nella blacklist del gruppo
