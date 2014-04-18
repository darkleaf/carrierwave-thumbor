require 'rest_client'
require 'carrierwave'
require 'carrierwave/thumbor'
require 'carrierwave/storage/thumbor'

class CarrierWave::Uploader::Base
  add_config :thumbor_image_endpoint

  configure do |config|
    config.storage_engines[:thumbor] = "CarrierWave::Storage::Thumbor"
  end
end