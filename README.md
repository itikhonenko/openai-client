# Openai::Client

This gem is a wrapper for calling the OpenAI and GPT-3 APIs.

* [Installation](#installation)
* [Usage](#usage)
* [OpenAI Models API](#openai-models-api)
* [OpenAI Completions API](#openai-completions-api)
* [OpenAI Edits API](#openai-edits-api)
* [OpenAI Image API](#openai-image-api)
  * [Create an Image](#create-an-image)
  * [Create an Image Edit](#create-an-image-edit)
  * [Create an Image Variation](#create-an-image-variation)
* [OpenAI Embeddings API](#openai-embeddings-api)
* [OpenAI Moderations API](#openai-moderations-api)
* [OpenAI Files API](#openai-files-api)
  * [List Files](#list-files)
  * [Find File](#find-file)
  * [Find File Content](#find-file-content)
  * [Upload File](#upload-file)
  * [Delete File](#delete-file)

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

- API key (`access_token`) <https://beta.openai.com/account/api-keys>.
- Organization ID (if needed) <https://beta.openai.com/account/org-settings>.

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

[API documentation](https://platform.openai.com/docs/api-reference/completions/create)

## OpenAI Edits API

```ruby
request_body = {
  model: 'text-davinci-edit-001',
  input: 'What day of the wek is it?',
  instruction: 'Fix the spelling mistakes'
}
Openai::Client.edits.create(request_body)
```

[API documentation](https://platform.openai.com/docs/api-reference/edits/create)

## OpenAI Image API

### Create an Image

```ruby
request_body = {
  prompt: 'A cute baby sea otter',
  n: 1,                  # between 1 and 10
  size: '1024x1024',     # 256x256, 512x512, or 1024x1024
  response_format: 'url' # url or b64_json
}
response = Openai::Client.images.create(request_body)
```

[API documentation](https://platform.openai.com/docs/api-reference/images/create)

### Create an Image Edit

```ruby
request_body = {
  image: '/absolute/path/to/image/you/want/to/change/img.png'
  mask: '/absolute/path/to/mask.png'
  prompt: 'A cute baby sea otter wearing a beret',
  n: 1,                  # between 1 and 10
  size: '1024x1024',     # 256x256, 512x512, or 1024x1024
  response_format: 'url' # url or b64_json
}
response = Openai::Client.images.edit(request_body)
```

- `image` - must be a valid PNG file, less than 4MB, and square. If mask is not provided, image must have transparency, which will be used as the mask.
- `mask` - an additional image whose fully transparent areas (e.g. where alpha is zero) indicate where image should be edited. Must be a valid PNG file, less than 4MB, and have the same dimensions as image.

[API documentation](https://platform.openai.com/docs/api-reference/images/create-edit)

### Create an Image Variation

```ruby
request_body = {
  image: '/absolute/path/to/image.png'
  n: 1,                  # between 1 and 10
  size: '1024x1024',     # 256x256, 512x512, or 1024x1024
  response_format: 'url' # url or b64_json
}
response = Openai::Client.images.variations(request_body)
```

- `image` - must be a valid PNG file, less than 4MB, and square.

[API documentation](https://platform.openai.com/docs/api-reference/images/create-variation)

## OpenAI Embeddings API

```ruby
request_body = {
  model: 'text-embedding-ada-002',
  input: 'The food was delicious and the waiter...'
}
Openai::Client.embeddings.create(request_body)
```

[API documentation](https://platform.openai.com/docs/api-reference/embeddings/create)

## OpenAI Moderations API

```ruby
request_body = {
  model: 'text-moderation-latest', # text-moderation-stable or text-moderation-latest
  input: 'I want to kill them.'
}
Openai::Client.moderations.create(request_body)
```

[API documentation](https://platform.openai.com/docs/api-reference/moderations/create)

## OpenAI Files API

### List Files

```ruby
Openai::Client.files.list
```

[API documentation](https://platform.openai.com/docs/api-reference/files/list)

### Find File

```ruby
Openai::Client.files.find(file_id)
```

[API documentation](https://platform.openai.com/docs/api-reference/files/retrieve)

### Find File Content

```ruby
Openai::Client.files.find_content(file_id)
```

[API documentation](https://platform.openai.com/docs/api-reference/files/retrieve-content)

### Upload File

```ruby
request_body = {
  file: '/absolute/path/to/file.jsonl',
  purpose: 'fine-tune'
}
Openai::Client.files.upload(request_body)
```
> The file format must be jsonl, where each line contains the prompt and completion properties.

Example (file.jsonl):

```json
{"prompt": "<prompt text>", "completion": "<ideal generated text>"}
{"prompt": "<prompt text>", "completion": "<ideal generated text>"}
...
```

[API documentation](https://platform.openai.com/docs/api-reference/files/upload)

### Delete File

```ruby
Openai::Client.files.delete(file_id)
```

[API documentation](https://platform.openai.com/docs/api-reference/files/delete)

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/itikhonenko/openai-client>.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
