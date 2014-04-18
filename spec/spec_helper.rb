require 'bundler/setup'
require 'carrierwave'

Bundler.require

CarrierWave.configure do |config|
  config.reset_config
  config.thumbor_image_endpoint = 'localhost:8888/image'
end

RSpec.configure do |config|

end


