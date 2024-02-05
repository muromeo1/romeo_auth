require_relative 'lib/romeo_auth/version'

Gem::Specification.new do |spec|
  spec.name = 'romeo_auth'
  spec.version = RomeoAuth::VERSION
  spec.authors = ['Murilo Romeo']
  spec.email = %w[muriloh65@gmail.com]
  spec.homepage = 'https://github.com/muromeo1/romeo_auth'
  spec.summary = 'A token based API authentication'
  spec.description = 'A token based API authentication'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.2'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
    end

  spec.add_dependency 'bcrypt'
  spec.add_dependency 'interactor', '~> 3.0'
  spec.add_dependency 'jwt'
  spec.add_dependency 'rails', '>= 7.1.3'
  spec.add_dependency 'rubocop-performance'
  spec.add_dependency 'rubocop-rails'
  spec.add_dependency 'rubocop-rspec'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
