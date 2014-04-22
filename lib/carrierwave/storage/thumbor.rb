module CarrierWave
  module Storage
    class Thumbor < Abstract
      class Connection
        attr_reader :thumbor_url

        def initialize(options = {})
          @thumbor_url = options[:thumbor_url]
        end

        def store(file)
          response = RestClient.post "#{thumbor_url}/image", media: file
          location = response.headers[:location]
          identifier_from_location location
        end

        private

        def identifier_from_location(location)
          location[/\A\/image(.*)/, 1]
        end
      end

      class File
        attr_reader :uploader, :identifier

        def initialize(uploader, identifier = nil)
          @uploader = uploader
          @identifier = identifier
        end

        def url
          "#{@thumbor_url}/image#{identifier}"
        end

        def store!(file)
          @identifier = connection.store file
        end

        private

        def connection
          @connection ||= Connection.new thumbor_url: uploader.thumbor_url
        end

      end

      attr_reader :identifier

      def store!(file)
        reopened_file = ::File.open(file.file)
        f = File.new uploader
        @identifier = f.store!(reopened_file)
        f
      end

      def retrieve!(identifier)
        File.new uploader, identifier
      end
    end
  end
end
