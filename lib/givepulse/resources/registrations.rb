module Givepulse
    module Resources
        class Registrations < Givepulse::Resource
            SUPPORTED_METHODS = %i[get].freeze

            def initialize(client)
                super(client, '/registrations', SUPPORTED_METHODS)
            end
        end
    end
end
