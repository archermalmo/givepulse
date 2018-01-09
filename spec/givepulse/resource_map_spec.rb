require 'spec_helper'

RSpec.describe Givepulse::ResourceMap do
    context 'resource exists in Givepulse::Resources namespace' do
        it 'should return a Users class' do
            expect(Givepulse::ResourceMap.get_resource_class(:users)).to eq(Givepulse::Resources::Users)
        end

        it 'should return a Education class' do
            expect(Givepulse::ResourceMap.get_resource_class(:education)).to eq(Givepulse::Resources::Education)
        end

        it 'should return a Affiliations class' do
            expect(Givepulse::ResourceMap.get_resource_class(:affiliations)).to eq(Givepulse::Resources::Affiliations)
        end

        it 'should return a Events class' do
            expect(Givepulse::ResourceMap.get_resource_class(:events)).to eq(Givepulse::Resources::Events)
        end

        it 'should return a Groups class' do
            expect(Givepulse::ResourceMap.get_resource_class(:groups)).to eq(Givepulse::Resources::Groups)
        end

        it 'should return a Impacts class' do
            expect(Givepulse::ResourceMap.get_resource_class(:impacts)).to eq(Givepulse::Resources::Impacts)
        end

        it 'should return a Memberships class' do
            expect(Givepulse::ResourceMap.get_resource_class(:memberships)).to eq(Givepulse::Resources::Memberships)
        end

        it 'should return a Registrations class' do
            expect(Givepulse::ResourceMap.get_resource_class(:registrations)).to eq(Givepulse::Resources::Registrations)
        end
    end
end
