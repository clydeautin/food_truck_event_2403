class Event

    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck
    end

    def food_truck_names
        names = food_trucks.map { |food_truck| food_truck.name }
    end

    def food_trucks_that_sell(item)
        trucks_with_item = food_trucks.select { |food_truck| food_truck.inventory.include?(item) }
        trucks_with_item
    end
end