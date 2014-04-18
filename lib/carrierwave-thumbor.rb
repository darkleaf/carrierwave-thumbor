require 'carrierwave/thumbor'
require 'carrierwave/storage/thumbor'

class CarrierWave::Uploader::Base
  configure do |config|
    config.storage_engines[:thumbor] = "CarrierWave::Storage::Thumbor"
  end
end