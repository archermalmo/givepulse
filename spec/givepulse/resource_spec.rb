require 'spec_helper'

RSpec.describe Givepulse::Resource do
    context 'method is supported' do
        before(:each) do
            @client = Givepulse::Client.new
            test_credentials = {
                consumer_key: 'testkey',
                consumer_secret: 'testsecret',
                user_email: 'test@email.com',
                user_password: 'testpassword'
            }
            @client.credentials(test_credentials)
            @resource = Givepulse::Resource.new(@client, '', %i[get create update delete])

            @stubbed_path = Givepulse::Connection::API_ROOT.dup
            @stubbed_path.path = @resource.path
        end

        it 'should successfully run :get' do
            stub_request(:get, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect(@resource.get).to eq({})
        end

        it 'should successfully run :create' do
            stub_request(:post, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect(@resource.create(nil)).to eq({})
        end

        it 'should successfully run :update' do
            stub_request(:put, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect(@resource.update(nil, nil)).to eq({})
        end

        it 'should successfully run :delete' do
            stub_request(:delete, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect(@resource.delete(nil)).to eq({})
        end
    end

    context 'method is not supported' do
        before(:each) do
            @client = Givepulse::Client.new
            test_credentials = {
                consumer_key: 'testkey',
                consumer_secret: 'testsecret',
                user_email: 'test@email.com',
                user_password: 'testpassword'
            }
            @client.credentials(test_credentials)
            @resource = Givepulse::Resource.new(@client, '', %i[])

            @stubbed_path = Givepulse::Connection::API_ROOT.dup
            @stubbed_path.path = @resource.path
        end

        it 'should not successfully run :get' do
            stub_request(:get, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect { @resource.get }.to raise_error(Givepulse::UnsupportedMethod)
        end

        it 'should not successfully run :create' do
            stub_request(:post, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect { @resource.create(nil) }.to raise_error(Givepulse::UnsupportedMethod)
        end

        it 'should not successfully run :update' do
            stub_request(:put, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect { @resource.update(nil, nil) }.to raise_error(Givepulse::UnsupportedMethod)
        end

        it 'should not successfully run :delete' do
            stub_request(:delete, @stubbed_path).to_return(
                status: 200,
                body: '{}'
            )
            expect { @resource.delete(nil) }.to raise_error(Givepulse::UnsupportedMethod)
        end
    end
end
