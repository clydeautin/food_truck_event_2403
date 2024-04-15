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
    
    describe 'stocking' do
        it 'can check stock on an item' do
            food_truck = FoodTruck.new("Rocky Mountain Pies")
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            binding.pry
            expect(food_truck.check_stock(item1)). to eq(0)
        end
    end
end