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
```

## OpenAI Models API
```ruby
# Models
Openai::Client.models.list

# Find a Model
Openai::Client.models.find(model_id)
```
## OpenAI Completions API
```ruby
request_body = {
  model: 'text-davinci-003',
  prompt: 'Say this is a test',
  max_tokens: 7,
  temperature: 0,
  top_p: 1,
  n: 1,
  stream: false,
  logprobs: nil,
  stop: "\n"
}
Openai::Client.completions.create(request_body)
```
[Completions request body documentation](https://platform.openai.com/docs/api-reference/completions/create)

## OpenAI Edits API
```ruby
request_body = {
  model: 'text-davinci-edit-001',
  input: 'What day of the wek is it?',
  instruction: 'Fix the spelling mistakes'
}
Openai::Client.edits.create(request_body)
```
[Edits request body documentation](https://platform.openai.com/docs/api-reference/edits/create)

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/itikhonenko/openai-client.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
