# Givepulse

This gem is a wrapper library around Givepulse's API providing a simple set of Ruby classes around interacting with your Givepulse data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'givepulse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install givepulse

## Usage

### Initializing an API client

First thing you must do when using this API is initialize a client and pass in your API authentication information and then call `:authorize` on your client object.

```ruby
require 'givepulse'

@client = Givepulse::Client.new(
    consumer_key: 'sample_consumer_key',
    consumer_secret: 'sample_consumer_secret',
    user_email: 'sample@user.com',
    user_password: 'sample_password'
)
@client.authorize
```

### Accessing data from API endpoints

Once you have initialized a client object, you can begin grabbing data from the API to use in your application. Not all REST endpoints are supported on every API resource, refer to the Givepulse API documentation to see what is available.

Using the client object follows an API like this

```ruby
affiliations = @client.affiliations.get

new_affiliation = @client.affiliations.create({
    'group1_id' => '12345',
    'group2_id' => '12346',
    'notify' => 'yes'
})

updated_affiliation = @client.affiliations.update(12345, {
    'approve' => 'yes'
})

deleted_affiliation = @client.affiliations.delete(12345)
```

### Filtering API responses

You can add filter and search data to GET requests by passing in Ruby objects to `:get` calls following the parameters documented in the Givepulse API documentation.

```ruby
admin_users = @client.users.get({
    'role' => 'admin'
})
```

### Using responses

All responses are returned as plain Ruby objects parsed from the JSON responses given by the API. So, you can use the returned data just like any other Ruby object.

```ruby
users = @client.users.get

first_user_email = users[:results][0][:email]
```

### Re-authorization

Authorization tokens for the API expire after two hours. The client object will automatically keep track of the time passed since authorization for you. To check if your token has expired, you can use the `:authorized?` method and call `:authorize` automatically if your token is expired to refresh it.

```ruby
unless @client.authorized?
    @client.authorize
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/archermalmo/givepulse.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
