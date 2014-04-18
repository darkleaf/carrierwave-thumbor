module CarrierWave
  module Storage
    class Thumbor < Abstract
      class File
        attr_reader :thumbor_url, :location

        def initialize(thumbor_url, location = nil)
          @thumbor_url = thumbor_url
          @location = location
        end

        def url
          "#{thumbor_url}/#{location}"
        end

        def store!(file)
          #TODO: fix me
          response = RestClient.post "#{thumbor_url}/image", media: file
          @location = response.headers[:location].gsub /\/image\//, ''
          p @location
        end
      end

      def identifier
        p "="*20
        p @identifier
        @identifier
      end

      def store!(file)
        f = File.new uploader.thumbor_url
        f.store!(::File.open(file.file))
        @identifier = f.location
        p @identifier
        f
      end

      def retrieve!(identifier)
        File.new uploader.thumbor_url, identifier
      end
    end
  end
end
