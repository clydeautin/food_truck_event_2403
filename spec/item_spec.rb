require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Item do
    describe 'initialize' do
        it 'is an instance of Item' do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

            expect(item1).to be_an_instance_of(Item)
        end
    end
end