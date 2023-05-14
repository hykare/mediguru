## Endpoints

### devise (doctors)

`GET`      `/doctors/sign_in`  
`POST`     `/doctors/sign_in`  
`DELETE`   `/doctors/sign_out`  
`GET`      `/doctors/password/new`  
`GET`      `/doctors/password/edit`  
`PATCH`    `/doctors/password`  
`PUT`      `/doctors/password`  
`POST`     `/doctors/password`  
`GET`      `/doctors/cancel`  
`GET`      `/doctors/sign_up`  
`GET`      `/doctors/edit`  
`PATCH`    `/doctors`  
`PUT`      `/doctors`  
`DELETE`   `/doctors`  
`POST`     `/doctors`  

`GET` `/specialties`  
list of medical specialties

`GET` `/doctors`  
list of all doctors

`GET` `/doctor`  
doctor info
params: auth token

`GET` `/appointments`  
params: on_date (defaults to today)


`GET` `/schedule`  
auth token

`PUT` `/schedule`  
auth token  
params: json schedule:
```json
schedule: 
  monday: { ... }
```

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

## Accessing Rails console

```
flyctl ssh console
/rails/bin/rails <rails command>
```

## Managing the database
Connect to the postgres database and run `psql` commands with:
```
flyctl pg connect -a mediguru-db
```