# RoRmaily Web UI

Web interface for [RoRmaily](https://github.com/ssoulless/RoRmaily) - Ruby on Rails email marketing solution.

## Requirements

Both Ruby on Rails 3.2 and 4 are supported. 

## Installation

Simply just run

    gem install maily_herald-webui

or put in your Gemfile

    gem "maily_herald-webui"

## Usage

Mount the WebUI in your application:

```ruby
# config/routes.rb
mount MailyHerald::Webui::Engine => "/maily_webui"
```

## Customizing

### Restricting access

The simplest way to restrict access to the Maily WebUI is to use Rails routing constraints:

```ruby
# config/routes.rb
mount MailyHerald::Webui::Engine => "/maily_webui", :constraints => MailyAccessConstraint.new
```

A sample `MailyAccessConstraint` implementation might look like this:

```ruby
class MailyAccessConstraint
  def matches?(request)
    return false unless request.session[:user_id]
    user = User.find request.session[:user_id]
    return user && user.admin?
  end
end
```

HTTP Basic auth can be used too:

```ruby
# config/routes.rb
MailyHerald::Webui::Engine.middleware.use Rack::Auth::Basic do |username, password|
  username == ENV["MAILY_USERNAME"] && password == ENV["MAILY_PASSWORD"]
end if Rails.env.production?

mount MailyHerald::Webui::Engine => "/maily_webui"
```

### Entity names

By default the WebUI displays entities (i.e. your users) using the `to_s` method. You can easily overwrite this method in your model to see your user names in the WebUI. Example below:

```ruby
class User < ActiveRecord::Base

  # ...

  def to_s
    "#{self.firstname} #{self.lastname}"
  end
end
```

## More Information

* [API Docs](http://www.rubydoc.info/github/ssoulless/RoRmaily)
* [Sample application](https://github.com/ssoulless/ror_maily_testapp)

For bug reports or feature requests see the [issues on Github](https://github.com/ssoulless/ror_maily-webui/issues).  

## License

LGPLv3 License. Copyright 2015

Initial development sponsored by University of Quindio (http://uniquindio.edu.co)

## Credits

* Based and inspired in [MailyHerald](https://github.com/Sology/maily_herald). Seeking to merge RoRmaily features with MailyHerald in a near future.
* Documentation Structure based on [Sharetribe](https://github.com/sharetribe/sharetribe) Docs templates.
