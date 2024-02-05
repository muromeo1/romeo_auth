# RomeoAuth
A token base authenticator for API's

## Usage
### Create an user:

Route
  ```
  POST /api/v1/users
  ```
  
Body:
  ```ruby
  {
    "name": "Murilo",
    "email": "muriloh65@gmail.com",
    "password": "12345",
    "password_confirmation": "12345"
  }
  ```
  
Response:
  ```ruby
  { "token: "e45es5jg..." }
  ```

***

### Create a session:

Route
  ```
  POST /api/v1/sessions
  ```
  
Body:
  ```ruby
  {
    "email": "muriloh65@gmail.com",
    "password": "12345",
  }
  ```
  
Response:
  ```ruby
  { "token: "os039jg..." }
  ```

## Installation
1 - Add this line to your application's Gemfile:
```ruby
gem 'romeo_auth', '>= 1.0.0'
```

2 - And then execute:
```bash
bundle install
```

3 - Install gem 
```bash
rails g romeo_auth:install
```

4 - Run migration 
```bash
rails db:migrate
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
