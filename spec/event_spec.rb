require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Event do
    describe 'initialize' do
        it 'is an instance of Event' do
            event = Event.new("South Pearl Street Farmers Market")

            expect(event).to be_an_instance_of(Event)
        end
    end
end