module CarrierWave
  module Thumbor
    autoload :VERSION, 'carrierwave/thumbor/version'
    autoload :ActiveRecord, 'carrierwave/thumbor/active_record'
  end
end

ActiveRecord::Base.extend CarrierWave::Thumbor::ActiveRecord::ClassMethods if defined? ActiveRecord
