require 'bundler/setup'
require 'webmock/rspec'

Bundler.require

RSpec.configure do |config|

end

def open_fixture(name)
   path = File.join(Dir.pwd, "spec", "fixtures", name)
   File.open path
end
