# XY-INC

A simple REST API service to create and list Points of interes by closeness.
This service user Ruby on Rails and Docker.

# Install and run

* Install docker - https://docs.docker.com/install/
* Install docker compose - https://docs.docker.com/compose/install/
* Open terminal and execute the following comands:
```shell
$ docker-compose build
$ docker-compose run web rails db:setup
$ docker-compose up
```
* Consume the service in `http://localhost:3000` as described in [swagger.yml](https://github.com/abnercarleto/xy-inc/blob/master/swagger.yml)
  * Use `POST /point_of_interests` to create a new PointOfInterest
  * Use `GET /point_of_interests` to list all PointOfInterests
  * Use `GET /point_of_interests/{id}` to return a specific PointOfInterest
  * Use `PUT /point_of_interests/{id}` to update a PointOfInterest
  * Use `GET /point_of_interests/closeness` to list all close PointOfInterests
