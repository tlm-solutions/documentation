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
    data-accumulator --> |<a href='https://github.com/dump-dvb/telegrams/blob/master/proto/telegram.proto'>gRPC</a>| dvb-api
		dvb-api --> |<a href='chapter_2_1_api.html'>REST</a>|windshield
		funnel --> |<a href='https://github.com/dump-dvb/telegrams/blob/master/src/models/r09.rs'>WebSocket</a>|windshield
    data-accumulator --> |<a href='https://github.com/dump-dvb/telegrams/blob/master/proto/telegram.proto'>gRPC</a>| funnel
    postgres-dvbdump --> grafana
    data-accumulator <--> postgres-dvbdump <--> clicky-bunty-server <-->|<a href='chapter_2_2_user_api.html'>WebSocket</a>| click[click]

		stopsjson -.-> dvb-api
		graphjson -.-> dvb-api

    postgres-dvbdump[(Postgres `dvbdump`)]
    dvb-api[api]
		graphjson[(graph.json)]
		stopsjson[(stops.json)]
    end

		user[/User\]
		grafana <-.- |<a href='https://monitoring.dvb.solutions'>HTTP</a>|user
		windshield <-.- |<a href='https://map.dvb.solutions'>HTTP</a>|user
		click[click] <-.- |<a href='https://click.dvb.solutions'>HTTP</a>|user

    click hardware-filter "https://github.com/dump-dvb/bandpass-filter" _blank
    click telegram-decoder "https://github.com/dump-dvb/decode-server" _blank
    click data-accumulator "https://github.com/dump-dvb/data-accumulator" _blank
    click click "https://github.com/dump-dvb/click" _blank
    click clicky-bunty-server "https://github.com/dump-dvb/clicky-bunty-server" _blank
    click funnel "https://github.com/dump-dvb/funnel" _blank
    click windshield "https://github.com/dump-dvb/windshield" _blank
    click dvb-api "https://github.com/dump-dvb/dvb-api" _blank

```
