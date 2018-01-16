require 'net/http'
require 'uri'
require 'cgi'
require 'json'

module Givepulse
    class Connection
        API_ROOT = URI('https://api2.givepulse.com').freeze

        attr_writer :authorization_token

        def initialize
            @client = Net::HTTP.new(API_ROOT.host, API_ROOT.port)
            @client.use_ssl = true
            @custom_headers = nil
        end

        def get(path, options = nil)
            query_string = options_to_query(options)
            full_path = "#{path}?#{query_string}"
            response = @client.get(full_path, generate_headers(@custom_headers))
            JSON.parse(response.body)
        end

        def post(path, data, options = nil)
            query_string = options_to_query(options)
            full_path = "#{path}?#{query_string}"
            response = @client.post(full_path, data, generate_headers(@custom_headers))
            JSON.parse(response.body)
        end

        def put(path, data, options = nil)
            query_string = options_to_query(options)
            full_path = "#{path}?#{query_string}"
            response = @client.put(full_path, data, generate_headers(@custom_headers))
            JSON.parse(response.body)
        end

        def delete(path, options = nil)
            query_string = options_to_query(options)
            full_path = "#{path}?#{query_string}"
            response = @client.delete(full_path, generate_headers(@custom_headers))
            JSON.parse(response.body)
        end

        def with_headers(headers)
            @custom_headers = headers
            yield(self)
            @custom_headers = nil
        end

        private

        def generate_headers(custom_headers = nil)
            headers = custom_headers.nil? ? {} : custom_headers.clone
            headers['Authorization'] = "Bearer #{@authorization_token}" if @authorization_token
            headers
        end

        def options_to_query(options)
            return if options.nil?
            query_parameters = []
            options.each do |key, value|
                query_parameters.push("#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}")
            end
            query_parameters.join('&')
        end
    end
end
