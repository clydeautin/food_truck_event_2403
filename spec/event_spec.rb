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
            expect(event.food_truck_names).to include("Rocky Mountain Pies")
        end
        it 'can show food trucks that sell a specific item' do
            event = Event.new("South Pearl Street Farmers Market")
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
            food_truck1.stock(item1, 35)
            food_truck1.stock(item2, 7)
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
            food_truck2.stock(item4, 50)
            food_truck2.stock(item3, 25)
            food_truck3 = FoodTruck.new("Palisade Peach Shack")
            food_truck3.stock(item1, 65)

            event.add_food_truck(food_truck1)
            event.add_food_truck(food_truck2)
            event.add_food_truck(food_truck3)

            expect(event.food_trucks_that_sell(item1)).to include(food_truck1, food_truck3)
            expect(event.food_trucks_that_sell(item4)).to include(food_truck2)
        end
    end
    describe 'revenue' do
        it 'can show potential earnings for a food truck' do
            event = Event.new("South Pearl Street Farmers Market")
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
            food_truck1.stock(item1, 35)
            food_truck1.stock(item2, 7)
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
            food_truck2.stock(item4, 50)
            food_truck2.stock(item3, 25)
            food_truck3 = FoodTruck.new("Palisade Peach Shack")
            food_truck3.stock(item1, 65)

            event.add_food_truck(food_truck1)
            event.add_food_truck(food_truck2)
            event.add_food_truck(food_truck3)
# binding.pry
            expect(food_truck1.potential_revenue).to eq(148.75)
            expect(food_truck2.potential_revenue).to eq(345.00)
            expect(food_truck3.potential_revenue).to eq(243.75)
        end
    end

    describe "#sorted_item_list" do 
        it 'Can show a list of items for sale with no duplicates' do
            event = Event.new("South Pearl Street Farmers Market")
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
            food_truck1.stock(item1, 35)
            food_truck1.stock(item2, 7)
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
            food_truck2.stock(item4, 50)
            food_truck2.stock(item3, 25)
            food_truck3 = FoodTruck.new("Palisade Peach Shack")
            food_truck3.stock(item1, 65)

            event.add_food_truck(food_truck1)
            event.add_food_truck(food_truck2)
            event.add_food_truck(food_truck3)
            alphabetical_list = [item1.name, item2.name, item3.name, item4.name].sort
            expect(event.sorted_item_list).to eq(alphabetical_list)
        end
    end

    describe 'inventory' do
        it 'can show a list of items that are overstocked' do
            event = Event.new("South Pearl Street Farmers Market")
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
            food_truck1.stock(item1, 35)
            food_truck1.stock(item2, 7)
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
            food_truck2.stock(item4, 51)
            food_truck2.stock(item3, 25)
            food_truck3 = FoodTruck.new("Palisade Peach Shack")
            food_truck3.stock(item1, 65)

            event.add_food_truck(food_truck1)
            event.add_food_truck(food_truck2)
            event.add_food_truck(food_truck3)

            expect(event.overstocked_items).to eq([item1])
        end

        it 'can show a list of total inventory' do
            event = Event.new("South Pearl Street Farmers Market")
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
            food_truck1.stock(item1, 35)
            food_truck1.stock(item2, 7)
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
            food_truck2.stock(item4, 51)
            food_truck2.stock(item3, 25)
            food_truck3 = FoodTruck.new("Palisade Peach Shack")
            food_truck3.stock(item1, 65)

            event.add_food_truck(food_truck1)
            event.add_food_truck(food_truck2)
            event.add_food_truck(food_truck3)

            expect(event.total_inventory).to include(item1 => {quantity => 100, food_truck => food_truck1, food_truck3})
        end
    end
end