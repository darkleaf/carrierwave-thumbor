require 'spec_helper'
class Uploader < CarrierWave::Uploader::Base
  storage :thumbor
end

describe CarrierWave::Storage::Thumbor do
  describe 'Uploader' do
    before do
      CarrierWave.configure do |config|
        config.thumbor_url = 'http://localhost:8888'
      end

      @uploader = Uploader.new
      @image = open_fixture 'image.jpg'
      @identifier = "/some_hash/some_file.jpg"
    end

    it 'store' do
      stub = stub_request(:post, "#{@uploader.thumbor_url}/image")
            .to_return(status: 200, body: '', headers: { location: "/image#{@identifier}" })

      @uploader.store! @image
      expect(@uploader.identifier).to eq(@identifier)
      expect(stub).to have_been_requested
    end

    it 'retrieve' do
      @uploader.retrieve_from_store! @identifier
      expect(@uploader.file.url).to eq("#{@uploader.thumbor_url}/image#{@identifier}")
    end
  end
end
