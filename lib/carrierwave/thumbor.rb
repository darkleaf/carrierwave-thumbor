module CarrierWave
  module Thumbor
    extend ActiveSupport::Autoload
    extend ActiveSupport::Concern

    autoload :VERSION
    autoload :ActiveRecord, 'carrierwave/thumbor/active_record'

    module ClassMethods
      def thumbor_options(string = nil)
        return @thumbor_options unless string
        @thumbor_options = string
      end
    end

    def thumbor_options
      partial = self.class.thumbor_options || 'image'
      "/#{partial}"
    end
  end
end

ActiveRecord::Base.extend CarrierWave::Thumbor::ActiveRecord::ClassMethods if defined? ActiveRecord
