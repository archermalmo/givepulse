module Givepulse
    module Resources
        class Memberships < Givepulse::Resource
            SUPPORTED_METHODS = %i[get create].freeze

            def initialize(client)
                super(client, '/memberships', SUPPORTED_METHODS)
            end
        end
    end
end
