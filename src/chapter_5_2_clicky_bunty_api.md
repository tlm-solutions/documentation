System Management API
----------------------

This is a websocket application. Your socket connection correspondes to your session.

# User

## Register
**Request**

```json
    {
        "operation": "user/register",
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
        "sucess": true,
        "id": "UUID"
    }
```


## Login

**Request**

```json
    {
        "operation": "user/login",
        "body": {
            "name": "Max_Mustermann",
            "password": "high end secure"
        }
    }
```

**Response**

```json
    {
        "sucess": true,
        "id": "UUID"
    }
```
## Session

will return the user identifier.

**Request**

```json
    {
        "operation": "user/session",
    }
```

**Response**

```json
    {
        "id": "UUID" 
    }
```

## Modifing Users

If you want to change the role you have to be an admin.

**Request**

```
    {
        "operation": "user/modify",
        "body": {
            "id": "UUID",
            "name": "New Maxmustermann",
            "email": "new_mail@protonmail.com",
            "password": "new_password",
            "role": 2
        }
    }
```

In order to make role updates you have to be administrator.

**Response**

```json
    {
        "sucess": true
    }
```

## Deleting Users

Only Admins can permanently delete users. If a user doesn't participate in the project he should instead deactivate his account.

**Request**

```
    {
        "operation": "user/delete",
        "body": {
            "id": "UUID"
        }
    }
```

**Response**

```json
    {
        "sucess": true
    }
```

## Deactivating Users

Only Admins and the effected user can call this endpoint. This point is for activating or deactivating user accounts.

**Request**

```
    {
        "operation": "user/deactivate",
        "body": {
            "id": "UUID",
            "deactivated": true
        }
    }
```

**Response**

```json
    {
        "sucess": true
    }
```

## Listing Users

Can only be called by a admin

**Request**

```
    {
        "operation": "user/list",
    }
```

**Response**

```json
    [
        {
            "id": "UUID",
            "name": "New Maxmustermann",
            "email": "new_mail@protonmail.com",
            "password": "new_password",
            "role": 2
        }
    ]
```


# Regions


## Create Regions

You need to be administrator to call this endpoint

**Request**

```json
    {
        "operation": "region/create",
        "body": {
            "name": "dresden",
            "frequency": 173000000,
            "transport_company": "dresdner verkehrs betriebe",
            "protocoll": ""
        }
    }
```

**Response**

```json
    {
        "success": true
    }
```

## Deleting Regions

You need to be administrator to call this endpoint

**Request**

```json
    {
        "operation": "region/delete",
        "body": {
            "id": 0
        }
    }
```

**Response**

```json
    {
        "success": true
    }
```

## Modifing Regions

You need to be adimistrator to call this endpoint

**Request**

```json
    {
        "operation": "region/modify",
        "body": {
            "id": 0,
            "name": "dresden",
            "frequency": 173000000,
            "transport_company": "dresdner verkehrs betriebe",
            "protocoll": ""
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
        "operation": "region/list"
    }
```

**Response**

```json
    [
        {
            "id": 0,
            "name": "dresden",
            "frequency": 173000000,
            "transport_company": "dresdner verkehrs betriebe",
            "protocoll": ""
        }
    ]
```

# Stations

## Create Station

**Request**

```json
    {
        "operation": "station/create",
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
        "success": true,
        "id": "UUID"
    }
```


## Modify Station

Delete the station and create a new one.


## Delete Station

Only Administrators can permanently delete stations if you are a user and want to deactivate yours consider using
`station/deactivate`.

**Request**

```json
    {
        "operation": "station/delete",
        "body": {
            "id": "UUID"
        }
    }
```

**Response**

```json
    {
        "success": true
    }
```

## Deactivating a Station

Only Administrators and the owner can deactivate stations.

**Request**

```json
    {
        "operation": "station/delete",
        "body": {
            "id": "UUID",
            deactivated: true
        }
    }
```

**Response**

```json
    {
        "success": true
    }
```

## List Stations

**Request**

```json
    {
        "operation": "station/list",
        "body": {
            "owner": "UUID", # optional
            "region": 0 # optional
        }
    }
```
if `owner` and `region` is set those will be used as filter.

**Response**

```json
     [
        {
            "id": 0,;
            "name": "Dresden Pieschen",
            "lat": 51.08106, 
            "lon": 13.72806,
            "region": 0, # reference to region with id 0
            "owner": "UUID" # reference to user with this id
        }
    ]
```


