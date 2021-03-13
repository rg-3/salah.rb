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
The library is implemented by making HTTP requests to the PrayerTimes.date web API,
which is free to use.
DESCRIPTION

  g.licenses    = ['MIT']
  g.files	= `git ls-files`.split($/)
  g.required_ruby_version = '>= 2.0'
  g.add_runtime_dependency 'openstruct-from_hash.rb'
end
