# ft_server

This project is based on creating a Docker image that it will install a complete web server. This server will run
multiples services: Wordpress, phpMyAdmin, and a SQL database.

## Description

### OS

debian:buster

### Server

Nginx

### Services

1) Wordpress
2) phpMyAdmin
3) SQL database

### Security

SSL Protocol

## Installation

1) At first you must have install **Docker**

2) Create image : `docker build .`

3) Run container : `docker run -it ID`
