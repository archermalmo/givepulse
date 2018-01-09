require 'spec_helper'

RSpec.describe Givepulse::Connection do
    context 'given a path' do
        TEST_PATH = '/'.freeze

        before(:each) do
            @connection = Givepulse::Connection.new
        end

        it 'does send a GET request' do
            stub_request(:get, Givepulse::Connection::API_ROOT).to_return(
                status: 200,
                body: '{}'
            )
            expect(@connection.get(TEST_PATH)).not_to be_nil
        end

        it 'does send a POST request' do
            stub_request(:post, Givepulse::Connection::API_ROOT).to_return(
                status: 200,
                body: '{}'
            )
            expect(@connection.post(TEST_PATH, nil)).not_to be_nil
        end

        it 'does send a PUT request' do
            stub_request(:put, Givepulse::Connection::API_ROOT).to_return(
                status: 200,
                body: '{}'
            )
            expect(@connection.put(TEST_PATH, nil)).not_to be_nil
        end

        it 'does send a DELETE request' do
            stub_request(:delete, Givepulse::Connection::API_ROOT).to_return(
                status: 200,
                body: '{}'
            )
            expect(@connection.delete(TEST_PATH)).not_to be_nil
        end
    end
end
