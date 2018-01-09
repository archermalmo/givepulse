module Givepulse
    module Resources
        class Users < Givepulse::Resource
            SUPPORTED_METHODS = %i[get create update].freeze

            def initialize(client)
                super(client, '/users', SUPPORTED_METHODS)
            end
        end
    end
end
