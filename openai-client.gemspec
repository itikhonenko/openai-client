# frozen_string_literal: true

require_relative 'lib/openai/client/version'

Gem::Specification.new do |spec|
  spec.name = 'openai-client'
  spec.version = Openai::Client::VERSION
  spec.authors = ['Ihor Tykhonenko']
  spec.email = ['tikhonenkoigor@gmail.com']

  spec.summary  = 'A Ruby gem for the OpenAI GPT-3 API'
  spec.homepage = 'https://github.com/itikhonenko/openai-client'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = "#{spec.homepage}/blob/main/README.md"
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('faraday', '~> 1.8')
  spec.add_dependency('faraday_middleware', '~> 1.2')
end
