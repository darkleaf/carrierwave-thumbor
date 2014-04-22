require 'spec_helper'

describe CarrierWave::Thumbor do
  before do
    uploader_class = Class.new CarrierWave::Uploader::Base do
      include CarrierWave::Thumbor
      storage :thumbor
      thumbor_url 'http://localhost:8888'

      version :thumb do
        thumbor_options 'unsafe/100x100'
      end
    end

    @uploader = uploader_class.new
  end

  describe 'Uploader' do
    before do
      @identifier = "/some_hash/some_file.jpg"
      @uploader.retrieve_from_store! @identifier
    end

    it 'get correct thumb url' do
      expect(@uploader.thumb.url).to eq("#{@uploader.thumbor_url}/unsafe/100x100#{@identifier}")
    end

    it 'get correct original url' do
      expect(@uploader.url).to eq("#{@uploader.thumbor_url}/image#{@identifier}")
    end
  end
end
