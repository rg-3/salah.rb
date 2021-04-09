$LOAD_PATH << 'lib'
require 'salah/version'
Gem::Specification.new do |g|
  g.name        = 'salah.rb'
  g.homepage    = 'https://github.com/rg-3/salah.rb#readme'
  g.authors	= ['rg']
  g.email       = '1aab@protonmail.com'
  g.version     = Salah::VERSION

  g.summary     = 'Salah.rb is a Ruby library that provides an API for retrieving Islamic prayer times.'

  g.description = <<-DESCRIPTION
Salah.rb is a Ruby library that provides an API for retrieving Islamic prayer times.
The library is implemented by making HTTP requests to the free-to-use PrayerTimes.date 
web API.
DESCRIPTION

  g.licenses    = ['MIT']
  g.files	= `git ls-files`.split($/)
  g.required_ruby_version = '>= 2.0'
  g.add_runtime_dependency 'openstruct-from_hash.rb', '~> 0.3'
  g.add_development_dependency 'rspec', '~> 3.10'
  g.add_development_dependency 'vcr', '~> 6.0'
  g.add_development_dependency 'webmock', '~> 3.12'
  g.add_development_dependency 'yardoc', '~> 0.9'
  g.add_development_dependency 'redcarpet', '~> 3.5'
end
