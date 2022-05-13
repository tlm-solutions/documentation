
# API Documentation

The API resides here: `https://api.dvb.solutions`

## Endpoints

- **GET /vehicles/{region}/all**

This endpoint returns the last positions of every vehicle in the region. 


##### Return

```json
    {
        "network": {
            "11": { // line number
                "3": { // run number
                    "position_id":322,
                    "line":62,
                    "run_number":8,
                    "time_stamp": 1652467595,
                    "delayed":-1,
                    "direction":0
                }
            }
        },
        "time_stamp": 0
    }
```

If you request an unknown region it will return **400 Bad Request**. The purpose of this Endpoint is for initializing
your application not the called continuesly.


- **POST /vehicles/{region}/query**

Will let you query for specific vehicles. This endpoint will take a **line number** and a **run number** and return
last seen position and other meta information about the vehicle.

##### Request Body
```json
    {
        "line": 3,
        "run_number": 11
    }
```

#####  Return

```json
    {
        "position_id":322,
        "line":3,
        "run_number":11,
        "time_stamp": 1652467595,
        "delayed":-1,
        "direction":0
    }
```

If you request an unkown region or this vehicle doesn't exist it will return **400 Bad Request**

- **POST /network/{region}/estimated_travel_time**

The endpoint will given an edge inside the network defined by **junction** and **direction** return a historical time that
vehicles took on that track and the destination junction, which will be reached next.

##### Request Body
```json
    {
        "junction": 121,
        "direction": 0
    }
```

##### Return
```json
    {
        "historical_time": 80,
        "destination": 122
    }
```

The returned time is in seconds. If the **junction**, **direction** or **region** is unknown it will return **400 Bad Request**

- **GET /static/{region}/coordinates**

Helper endpoint which gives you **latitude**, **longtitude** and **station_name** of a given **position**

##### Request Body
```json
    {
        "station_id": 121
    }
```

##### Return
```json
    {
        "lat": 13.6666,
        "lon": 51.55312,
        "station_name": "Albertplatz"
    }
```

If for a given station there real coordinates are unkown or the region does not exists the api will return **400 Bad Request**


