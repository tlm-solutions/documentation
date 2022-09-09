# Configuration

This part of docs assumes you are having a box with all the services running but not configured yet.


## Register a station

The managment of region, stations and users is done by [Click](https://click.dvb.solutions) so before 
you can get yourself a station you need to create a user which can manage all the stations. After you created a user and you are logged in there is a create station button. You have to give 
your station a name, region and a position (lat, lon). If the region, where the station is location doesn't show up please write us an email (<dump@dvb.solutions>) and consider reading: [finding the frequencies](/chapter_3_1_finding_frequencies.html). All the other fields are optional but very helpful for our side because, it helps us optimizing support for different hardware.

After your station is created there should be a token and a station id visible. The default place for the token is `/etc/telegram-decoder/token` so just:

```bash
    $ echo "<YOUR TOKEN>" > /etc/telegram-decoder/token
```

The config file is per default located under `/etc/telegram-decoder/settings.json`.

```bash
{
    "name": "Station Name",
    "lat": -1.0,
    "lon": -1.0,
    "id": "<YOUR STATION ID>",
    "region": -1
}
```

After you placed the configs file and restarted the service `systemctl restart telegram-decoder.service` everything should go smoothly.


