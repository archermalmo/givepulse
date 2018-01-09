module Givepulse
    module Resources
        class Impacts < Givepulse::Resource
            SUPPORTED_METHODS = %i[get].freeze

            def initialize(client)
                super(client, '/impacts', SUPPORTED_METHODS)
            end
        end
    end
end
