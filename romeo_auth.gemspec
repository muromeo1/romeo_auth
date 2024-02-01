require_relative 'lib/romeo_auth/version'

Gem::Specification.new do |spec|
  spec.name = 'romeo_auth'
  spec.version = RomeoAuth::VERSION
  spec.authors = ['Murilo Romeo']
  spec.email = %w[muriloh65@gmail.com]
  spec.homepage = 'http://google.com'
  spec.summary = 'Summary of RomeoAuth.'
  spec.description = 'Description of RomeoAuth.'
  spec.license = 'MIT'

  spec.metadata['allowed_push_host'] = "http://mygemserver.com"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] =
    "http://google.com"
  spec.metadata['changelog_uri'] = "http://google.com"

  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
    end

  spec.add_dependency 'bcrypt'
  spec.add_dependency 'jwt'
  spec.add_dependency 'interactor'
  spec.add_dependency 'rails', '>= 7.1.3'
end
