require 'rest_client'
require 'carrierwave'
require 'carrierwave/thumbor'
require 'carrierwave/storage/thumbor'
require 'active_support/concern'
require 'active_support/dependencies/autoload'
require 'active_support/core_ext/object/try'

class CarrierWave::Uploader::Base
  add_config :thumbor_url

  configure do |config|
    config.storage_engines[:thumbor] = "CarrierWave::Storage::Thumbor"
  end
end
