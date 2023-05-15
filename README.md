## Endpoints

`POST`     `/doctors`  
Sign up for a new account.  
params: email, password, specialty_id

`DELETE`   `/doctors`  
Delete an account.  
Authorization: Bearer {doctor auth token}

`POST`   `/doctors/sign_in`  
params: email, password
=> auth token

`DELETE`   `/doctors/sign_out`  
Authorization: Bearer {doctor auth token}

`GET` `/doctor`  
Get doctor profile information.  
Authorization: Bearer {doctor auth token}  
=> first_name, last_name, description, specialty

`PUT` `/doctors`  
Update doctor information.

params: first_name, last_name, description, specialty_id

`GET` `/schedule`  
Authorization: Bearer {doctor auth token}  
=>
```json
"schedule": {
  "monday": [ {"hour":8,"minute":0},{"hour":8,"minute":15},{"hour":8,"minute":30} ],
  "tuesday": [ {"hour":8,"minute":0},{"hour":8,"minute":15},{"hour":8,"minute":30} ],
  "wednesday": [],
  "thursday": [],
  "friday": [],
  "saturday": [],
  "sunday": [],
}
```

`PUT` `/schedule`  
Authorization: Bearer {doctor auth token}

params: json schedule:
```json
"schedule": {
  "monday": [ {"hour":8,"minute":0},{"hour":8,"minute":15},{"hour":8,"minute":30} ],
  "tuesday": [ {"hour":8,"minute":0},{"hour":8,"minute":15},{"hour":8,"minute":30} ],
  "wednesday": [],
  "thursday": [],
  "friday": [],
  "saturday": [],
  "sunday": [],
}
```

`GET` `/appointments`  
Authorization: Bearer {doctor auth token}   
params: on_date (optional, defaults to today)  
=> ...

`GET` `/specialties`  
=> ...

## Deployment

Currently the postgres database scales to 0 (shuts down) after 1 hr of inactivity. To turn it back on:

```
fly machines start 1781345a271189 --app mediguru-db
```

In case the machine ever changes it can be found with:
```
fly machines list --app <db app name>
```
The VM will show up with `stopped` state. Note the machine id.

then run:
```
fly machines start <machine-id> --app <db app name>
```

### Accessing Rails console

```
flyctl ssh console
/rails/bin/rails <rails command>
```

### Managing the database
Connect to the postgres database and run `psql` commands with:
```
flyctl pg connect -a mediguru-db
```

### Turning the production app off

```
flyctl scale count 0
```
