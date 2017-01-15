# People Management Application

This is the People Management Application, this app is used to handle people information, such as their names, emails and a little bit about them, and also to notify the users when someone just arrive or sadly have to go.

This app uses the following:

- Rails 4.2.5.2
- Ruby 2.2.4
- MySQL
- Redis

You have to be sure that you have Redis and MySQL installed, along with the ruby version mentioned before.

## Delivered



## Database Configuration File

to setup the `database.yml` file you have to use the following command inside the project folder

`$ cp config/database.example.yml config/database.yml`

This in order to have all you need to save into the database


## Creating The Database

After the step above, you have to run the following lines in the terminal

`$ rake db:create` to create the development and test databases

`$ rake db:migrate` to create the tables in the database

`$ rake db:seed` to create some data to play with.

## Running The Project

This project uses foreman, so you can start all the needed services, to use it just run `$ foreman start` in the terminal
and to access you have to put in your browser `localhost:5300`

## Testing

This projects uses minitest as the test framework, so to run the tests you have to execute `$ rake test` in the terminal
