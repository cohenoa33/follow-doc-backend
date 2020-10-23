# Welcome to FollowDoc: backend

## Description:

Keep track of your and your family's medical issues and doctor appointments.
Create a list of follow-up items, add notes, and upload related docs.

You will also be able to keep a to-do list of all the ongoing items and have an organized list of your future and past appointments.

## Database initialization

This application is using `postgreSQL` as database.

## Installation

- Fork and clone repository.
- Navigate into the directory where you cloned the repository.
- Enter the command `bundle install` in the terminal.
- Run `sudo service postgresql start` before starting
- Run `rails db:migrate` in the terminal.
- Run `rails db:seed` in the terminal for testing data.
- Run `rails s` to begin server and navigate to your browser 'localhost:3000' (or the server you are running) to view the website!

## Ruby version

The application runs on Ruby 2.7.0

For `rvm` users, be sure to run:

```
rvm use ruby 2.7.0
```

## System dependencies

Install rails server and run `rails s` to start this backend server.

## Frontend

https://github.com/cohenoa33/follow-doc-frontend
