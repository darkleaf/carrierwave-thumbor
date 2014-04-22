require 'spec_helper'


describe CarrierWave::Storage::Thumbor do

  describe 'Uploader' do
    before do
      uploader_class = Class.new CarrierWave::Uploader::Base do
        storage :thumbor
        thumbor_url 'http://localhost:8888'
      end
      @uploader = uploader_class.new
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
      expect(@uploader.url).to eq("#{@uploader.thumbor_url}/image#{@identifier}")
    end
  end
end
