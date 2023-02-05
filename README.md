# Openai::Client
This gem is a wrapper for calling the OpenAI and GPT-3 APIs.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'openai-client'
```
And then execute:
```bash
bundle
```
Or install it yourself as:
```bash
gem install openai-client
```

## Usage
- API key (`access_token`) https://beta.openai.com/account/api-keys.
- Organization ID (if needed) https://beta.openai.com/account/org-settings.

```ruby
require 'openai-client'

Openai::Client.configure do |c|
  c.access_token    = 'access_token'
  c.organization_id = 'organization_id' # optional
end

# Models
Openai::Client.models.list

# Find a Model
Openai::Client.models.find(model_id)
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/itikhonenko/openai-client.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).