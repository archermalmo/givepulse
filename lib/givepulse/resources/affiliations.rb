module Givepulse
    module Resources
        class Affiliations < Givepulse::Resource
            SUPPORTED_METHODS = %i[get create update delete].freeze

            def initialize(client)
                super(client, '/affiliations', SUPPORTED_METHODS)
            end
        end
    end
end
