# Services and Dataflow

There quite a lot of services required to acquire and preset the public transport data.
The figure below shows the current services and which data in what format flows between them.
Clicking on different text boxes will open their GitHub repository or documentation.

```mermaid
flowchart TB
    subgraph traffic-stop-box
    antenna --> hardware-filter --> SDR --> |IQ samples| telegram-decoder
    end

    telegram-decoder -.->|HTTP Post| data-accumulator

    subgraph data-hoarder
    data-accumulator -->|gRPC| funnel --> |WebSocket|windshield
    data-accumulator --> |gRPC| dvb-api --> |REST|windshield
    data-accumulator --> postgres-telegrams
    postgres-telegrams --> grafana
    data-accumulator <--> postgres-dvbdump <--> clicky-bunty-server <-->|WebSocket| click[click]
    postgres-telegrams[Postgres `telegrams`]
    postgres-dvbdump[Postgres `dvbdump`]
    dvb-api[api]
    end

    click hardware-filter "https://github.com/dump-dvb/bandpass-filter" _blank
    click telegram-decoder "https://github.com/dump-dvb/decode-server" _blank
    click data-accumulator "https://github.com/dump-dvb/data-accumulator" _blank
    click click "https://github.com/dump-dvb/click" _blank
    click clicky-bunty-server "https://github.com/dump-dvb/clicky-bunty-server" _blank
    click funnel "https://github.com/dump-dvb/funnel" _blank
    click windshield "https://github.com/dump-dvb/windshield" _blank
    click dvb-api "https://github.com/dump-dvb/dvb-api" _blank

```
