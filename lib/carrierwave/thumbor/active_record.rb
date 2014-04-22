module CarrierWave
  module Thumbor
    module ActiveRecord
      module ClassMethods
        def mount_thumbor_uploader(*args)
          column_name = args.first.to_s

          mount_uploader *args
          skip_callback :save, :after, "store_#{column_name}!"
          skip_callback :save, :before, "write_#{column_name}_identifier"
          before_save "store_#{column_name}!"
          before_save "write_#{column_name}_identifier"
        end
      end
    end
  end
end
