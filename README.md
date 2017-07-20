Shoe Tracker

By Paul Nderitu

With this application, a user can enter shoe store information, enter shoe brands, and display which brands a shoe store carries, and which stores carry a brand.

Technologies Used

Application: Ruby, Sinatra
Testing: Rspec, Capybara
Database: Postgres, ActiveRecord
Installation

Install Shoe Finder by cloning the repository.

$ git clone https://github.com/paulnderitu/shoe_tracker
Install required gems:

$ bundle install
Run Postgres:

$ postgres
Navigate to project file and migrate database:

$ rake db:migrate
Start the Sinatra webserver:

$ ruby app.rb
Navigate to localhost:4567 from any browser.

License

This software is licensed under the MIT license.
Copyright (c) 2017 Paul Nderitu
