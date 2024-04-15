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
    describe 'managing food trucks' do
        it 'can add a food truck' do
            event = Event.new("South Pearl Street Farmers Market")
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")

            event.add_food_truck(food_truck1)

            expect(event.food_trucks).to include(food_truck1)
        end
    end
end