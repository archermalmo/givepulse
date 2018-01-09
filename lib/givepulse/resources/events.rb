module Givepulse
    module Resources
        class Events < Givepulse::Resource
            SUPPORTED_METHODS = %i[get].freeze

            def initialize(client)
                super(client, '/events', SUPPORTED_METHODS)
            end
        end
    end
end
