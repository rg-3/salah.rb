require 'salah'
require 'rspec'
require 'vcr'
require_relative 'shared_examples/salah.today'

VCR.configure do |c|
  c.cassette_library_dir = File.join __dir__, 'fixtures', 'vcr_cassettes'
  c.hook_into :webmock
end
