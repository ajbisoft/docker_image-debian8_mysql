# Docker image: debian9_mysql

## Description

Official Debian 9 (debian:9) + Official MySQL Server 5.7 docker image with some customization:
* Added official MySQL 5.7 repository
* Port 3306 is binded to 0.0.0.0
* ENTRYPOINT set to autostart mysql-server service
* If empty data volume is detected it will be initiated with new database

## Usage

There are two main run-time settings that may be passed to newly created container from this image:
* Port must be published when starting container by adding `-p 3306:3306` to your `docker run` statement if you want mysql service to be binded to host interfaces
* If you want keep you data, a data volume must be attached when starting container by adding `-v <path_to_your_datadir>:/var/lib/mysql/` to your `docker run` statement. Please check permissions as container will not start if those are wrong.
* I've also added a "first run" feature that will create a brand new database for you if no valid data is found on attached volume, so when running for the first time, you can mount an empty volume

## Example

To successfully start a new container using this image please specify port (here port 3306) and volume options as in following example:
`docker run -dp 3306:3306 -v <path_to_your_datadir>:/var/lib/mysql/ --name <your-app-name> ajbisoft/debian8-mysql`
This will expose and publish mysql container on port 3306 on all host interfaces, but you may skip `-p 3306:3306` option and use container linking to access MySQL container from within your app.

## Summary

This docker image is best suited for simple MySQL applications. It can be used to make MySQL service avaiable on your host or it may be used within container network only. To run PHP web applications with this container you might be interested in my `ajbisoft/debian9_lamp` container.

Should you need to use another database backend (like Postgres) with your project, please see my other docker images!
