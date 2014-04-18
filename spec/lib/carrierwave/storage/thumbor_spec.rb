require 'spec_helper'
class Uploader < CarrierWave::Uploader::Base
  storage :thumbor
end

describe CarrierWave::Storage::Thumbor do
  describe 'Uploader' do
    before do
      CarrierWave.configure do |config|
        #config.thumbor_url = 'localhost:8888/image'
        config.thumbor_url = 'http://img.staging.nptv.home'
      end

      @uploader = Uploader.new
      @image = open_fixture 'image.jpg'
    end

    it 'store' do
      @uploader.store! @image

      p @uploader.url

    end
  end
end
