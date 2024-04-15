require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Food_truck do
    describe 'initialize' do
        it 'is an instance of Item' do
            food_truck = FoodTruck.new("Rocky Mountain Pies")

            expect(food_truck).to be_an_instance_of(Food_truck)
        end
    end
end