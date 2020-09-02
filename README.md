# README

Hello ! This APP does
- take in 10000 items from a json file that lives in db/ folder to seed db with order-items
  (change or cancel limit in seed.rb file)
- render a react-rails-generated Summary component that receives props from rails controller

This app should:
- let a user get data for selected country
- render a second component showing data-viz
- look better (semantic-ui not working for some reason)



* Ruby version
  Ruby 2.6.3
* System dependencies
  Rails 6.0.3

* Configuration
  add react-rails to gemfile
  follow instructions

* Database creation
  run rails db:create

* Database initialization
  run rails db:migrate

* Deployment instructions

  run rails s - to launch rails server
  run bin/webpack-dev-server in a second terminal window to run dev server

  fork or clone repo
  seed db with json file

* ...
