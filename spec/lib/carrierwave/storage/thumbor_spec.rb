require 'spec_helper'
class Uploader < CarrierWave::Uploader::Base
  storage :thumbor
end

describe CarrierWave::Storage::Thumbor do
  describe 'Uploader' do
    before do
      CarrierWave.configure do |config|
        #config.thumbor_image_endpoint = 'localhost:8888/image'
        config.thumbor_image_endpoint = 'http://img.staging.nptv.home/image'
      end

      @uploader = Uploader.new
      @image = open_fixture 'image.jpg'
    end

    it 'store' do
      @uploader.store! @image
    end
  end
end
