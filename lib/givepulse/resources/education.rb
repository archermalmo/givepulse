module Givepulse
    module Resources
        class Education < Givepulse::Resource
            SUPPORTED_METHODS = %i[get create update delete].freeze

            def initialize(client)
                super(client, '/educations', SUPPORTED_METHODS)
            end
        end
    end
end
