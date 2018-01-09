require 'spec_helper'
require 'json'

RSpec.describe Givepulse::Client do
    context 'with credentials are supplied' do
        before(:each) do
            @givepulse = Givepulse::Client.new

            test_credentials = {
                consumer_key: 'testkey',
                consumer_secret: 'testsecret',
                user_email: 'test@email.com',
                user_password: 'testpassword'
            }
            @givepulse.credentials(test_credentials)
        end

        it 'authorizes the user' do
            stubbed_response = {
                token: 'testtoken'
            }
            stubbed_path = Givepulse::Connection::API_ROOT.dup
            stubbed_path.path = '/auth'
            stub_request(:post, stubbed_path).to_return(
                status: 200,
                body: stubbed_response.to_json
            )
            expect(@givepulse.authorize!).to eq(true)
        end
    end

    context 'when credentials are not supplied' do
        before(:each) do
            @givepulse = Givepulse::Client.new
        end

        it 'does not authorize the user' do
            expect(@givepulse.authorize!).not_to eq(true)
        end
    end

    context 'when authorization has expired' do
        before(:each) do
            @givepulse = Givepulse::Client.new

            test_credentials = {
                consumer_key: 'testkey',
                consumer_secret: 'testsecret',
                user_email: 'test@email.com',
                user_password: 'testpassword'
            }
            @givepulse.credentials(test_credentials)

            stubbed_response = {
                token: 'testtoken'
            }
            stubbed_path = Givepulse::Connection::API_ROOT.dup
            stubbed_path.path = '/auth'
            stub_request(:post, stubbed_path).to_return(
                status: 200,
                body: stubbed_response.to_json
            )
            @givepulse.authorize!
        end

        it 'should not be authorized' do
            Timecop.freeze(Time.now + (60 * 60 * 2) + 1) do
                expect(@givepulse.authorized?).to eq(false)
            end
        end
    end

    context 'when authorization has not expired' do
        before(:each) do
            @givepulse = Givepulse::Client.new

            test_credentials = {
                consumer_key: 'testkey',
                consumer_secret: 'testsecret',
                user_email: 'test@email.com',
                user_password: 'testpassword'
            }
            @givepulse.credentials(test_credentials)

            stubbed_response = {
                token: 'testtoken'
            }
            stubbed_path = Givepulse::Connection::API_ROOT.dup
            stubbed_path.path = '/auth'
            stub_request(:post, stubbed_path).to_return(
                status: 200,
                body: stubbed_response.to_json
            )
            @givepulse.authorize!
        end

        it 'should be authorized' do
            expect(@givepulse.authorized?).to eq(true)
        end
    end
end
