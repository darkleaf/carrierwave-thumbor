module CarrierWave
  module Storage
    class Thumbor < Abstract
      def store!(file)
        p uploader.thumbor_image_endpoint
        p RestClient.post uploader.thumbor_image_endpoint, media: file.file
      end

      def retrieve!(identifier)
      end
    end
  end
end
