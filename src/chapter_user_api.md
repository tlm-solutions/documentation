# User API

This is a websocket application. Your socket connection correspondes to your session.

## Register
**Request**

```json
    {
        "operation": "register",
        "body": {
            "name": "Max_Mustermann",
            "email": "ottonormal@gmx.de",
            "password": "high end secure"
        }
    }
```

**Response**

```json
    {
        "sucess": true
    }
```


## Login

**Request**

```json
    {
        "operation": "login",
        "body": {
            "name": "Max_Mustermann",
            "password": "high end secure"
        }
    }
```

**Response**

```json
    {
        "sucess": true
    }
```

## Create Station

**Request**

```json
    {
        "operation": "create_station",
        "body": {
            "name": "Dresden Station Pieschen",
            "lat": 0.0,
            "lon": 0.0,
            "region": 0 # references to region 
        }
    }
```

**Response**

```json
    {
        "success": true
    }
```


## List Regions

Returns all `regions`

**Request**

```json
    {
        "operation": "list_regions"
    }
```

**Response**

```json
    {
        "regions": [
            {
                "id": 0,
                "name": "dresden",
                "frequency": 173000000,
                "transport_company": "dresdner verkehrs betriebe",
                "protocoll": ""
            }
        ];
    }
```

## List Stations

**Request**

```json
    {
        "operation": "list_stations",
        "body": {
            "owner": "UUID", # optional
            "region": 0 # optional
        }
    }
```
if `owner` and `region` is set those will be used as filter.

**Response**

```json
    {
        "stations": [
            {
                "id": 0,
                "name": "Dresden Pieschen",
                "lat": 51.08106, 
                "lon": 13.72806,
                "region": 0, # reference to region with id 0
                "owner": "UUID" # reference to user with this id
            }
        ];
    }
```


