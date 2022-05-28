require './lib/room'
require './lib/house'

RSpec.describe House do
  before (:each) do
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  it "exists" do
    expect(@house).to be_a(House)
  end

  it "has attributes" do
    expect(@house.price).to eq(400000)
    expect(@house.address).to eq("123 sugar lane")
  end

  it "has an array of rooms to default empty" do
      expect(@house.rooms).to eq([])
  end

  it "has rooms" do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    expect(@house.rooms).to eq([@room_1, @room_2, @room_3, @room_4])
  end

  it "defines above_market_average" do
    expect(@house.above_market_average?).to eq(false)
  end

  it "returns all rooms from category" do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_4)

    expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
    expect(@house.rooms_from_category(:basement)).to eq([@room_4])
  end

  it "has area" do
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    expect(@house.area).to eq(1900)
  end

  it "has details" do
    expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
  end

end
