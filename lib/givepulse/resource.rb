module Givepulse
    class Resource
        attr_reader :client

        attr_accessor :path

        def initialize(client, path, supported_methods)
            @client ||= client
            @path ||= path
            @supported_methods ||= supported_methods.clone
        end

        def get(options = nil)
            raise Givepulse::UnsupportedMethod, self.class unless @supported_methods.include?(__method__)
            @client.connection.get(@path, options)
        end

        def create(data)
            raise Givepulse::UnsupportedMethod, self.class unless @supported_methods.include?(__method__)
            @client.connection.post(@path, data)
        end

        def update(id, data)
            raise Givepulse::UnsupportedMethod, self.class unless @supported_methods.include?(__method__)
            @client.connection.put("#{@path}/#{id}", data)
        end

        def delete(id)
            raise Givepulse::UnsupportedMethod, self.class unless @supported_methods.include?(__method__)
            @client.connection.delete("#{@path}/#{id}")
        end
    end
end
