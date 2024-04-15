require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe FoodTruck do
    describe 'initialize' do
        it 'is an instance of food_truck' do
            food_truck = FoodTruck.new("Rocky Mountain Pies")

            expect(food_truck).to be_an_instance_of(FoodTruck)
        end
    end
end