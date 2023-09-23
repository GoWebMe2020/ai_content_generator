# AI Content Generator

## Description

This will act as a simple template that allows the user to make calls to and display responses from an AI platform.

## Technologies

* Ruby on Rails
* Devise
* Bootstrap
* VS Code
* Google Chrome

## User Stories

- [x] As a user, I would like to be able to register on the website with and email and a password.
- [x] As a user, I would like to login and logout of the website.
- [ ] As a user, I would like to make a start a chat and receive a response.

## Setup

* Clone this repo to your local machine
* Cd into the repo
* Create a role for the application in postgres
  * https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres
  * https://www.postgresqltutorial.com/postgresql-administration/postgresql-roles/
* Run the following commands in your terminal
```ruby
# This will create the databases locally
%> rails db:setup

# This will migrate and create the necessary tables
%> rails db:migrate

# This will start the server
%> rails s
```
* Visit `http://localhost:3000/` in your preferred browser.

## References

* https://www.youtube.com/watch?v=_3AsaXoLdj4&t=2646s
* https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres
* https://www.postgresqltutorial.com/postgresql-administration/postgresql-roles/
* https://github.com/heartcombo/devise
