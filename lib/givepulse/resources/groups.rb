module Givepulse
    module Resources
        class Groups < Givepulse::Resource
            SUPPORTED_METHODS = %i[get create update].freeze

            def initialize(client)
                super(client, '/groups', SUPPORTED_METHODS)
            end
        end
    end
end
