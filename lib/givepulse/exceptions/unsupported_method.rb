module Givepulse
    class UnsupportedMethod < StandardError
        def initialize(resource_class)
            super("This method is not supported on #{resource_class}")
        end
    end
end
