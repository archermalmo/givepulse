require 'cgi'
require 'base64'
require 'givepulse/connection'
require 'givepulse/resource_map'
require 'pry'

module Givepulse
    # Class that will call any methods for retrieving data from the Givepulse API
    class Client
        attr_writer :consumer_key
        attr_writer :consumer_secret
        attr_writer :user_email
        attr_writer :user_password

        attr_reader :connection

        def initialize(credentials = nil)
            # Initialize connection object
            @connection = Givepulse::Connection.new

            return if credentials.nil?
            @consumer_key ||= credentials[:consumer_key]
            @consumer_secret ||= credentials[:consumer_secret]
            @user_email ||= credentials[:user_email]
            @user_password ||= credentials[:user_password]
            @authorization_expiration ||= nil
        end

        def credentials(credentials)
            @consumer_key ||= credentials[:consumer_key]
            @consumer_secret ||= credentials[:consumer_secret]
            @user_email ||= credentials[:user_email]
            @user_password ||= credentials[:user_password]
        end

        def authorize!
            return false unless @consumer_key && @consumer_secret && @user_email && @user_password
            custom_headers = {
                'Authorization' => "Basic #{generate_header_string}"
            }
            @connection.with_headers(custom_headers) do |connection|
                response = connection.post('/auth', nil)
                return false if response['error']
                @connection.authorization_token = response['token']
                @authorization_expiration = Time.new + (60 * 60 * 2)
            end
            true
        end

        def authorized?
            return false unless @authorization_expiration
            # Reset the authorization token if it's expired
            @connection.authorization_token = nil if Time.now < @authorization_expiration
            Time.now < @authorization_expiration
        end

        def method_missing(method_name, *args, &block)
            resource_class = Givepulse::ResourceMap.get_resource_class(method_name)
            if resource_class
                resource_class.new(self)
            else
                super
            end
        end

        def respond_to_missing?(method_name, include_private = false)
            Givepulse::ResourceMap.get_resource_class(method_name) || super
        end

        private

        def generate_header_string
            escaped_values = [
                CGI.escape(@consumer_key),
                CGI.escape(@consumer_secret),
                CGI.escape(@user_email),
                CGI.escape(@user_password)
            ]
            Base64.strict_encode64(escaped_values.join(':'))
        end
    end
end
