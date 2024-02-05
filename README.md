# RomeoAuth
RomeoAuth is a robust token-based authentication system designed to simplify user authentication for APIs in your Rails application. With an easy setup process, it automates the creation of user models, controllers, and authentication methods, allowing you to seamlessly integrate secure user authentication into your project.

## Features
- **User Model Generation:** Automatically creates a user model with essential attributes, such as name, email, password, and password confirmation.
  
- **Controller Automation:** Generates user and session controllers with the necessary methods to facilitate user creation and session handling.
  
- **Authenticable Method:** Provides an authenticable method, ensuring a secure and standardized approach to user authentication.
  
- **Current User Retrieval:** Introduces a current_user method, allowing easy access to the authenticated user within controllers.

## Usage
### Routes
Upon installation of RomeoAuth, routes for user and session functionalities will be seamlessly mounted in your Rails application within `/api/v1`. This automatic route mounting simplifies the integration process, allowing you to access the authentication endpoints effortlessly. The generated routes provide a clear and consistent structure for user creation, session handling, and authentication, ensuring a smooth experience as you incorporate authentication features into your project.

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
***

### Require authetication for controllers:

In your controller, adds:
```ruby
class FooController < ApplicationController
  before_action :authorize!
end
```

Now all the requests to the controller will need to send token in header:
```ruby
{ "Authentication" => "e9sa083..." }
```

It's also possible to get the current user within the controller with method:
```ruby
current_user
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
