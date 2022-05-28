class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return true if @price >= 500000
    false
  end

  def rooms_from_category(category)
    rooms_array = []

    @rooms.each do |room|
      if room.category == category
        rooms_array << room
      end
    end
    rooms_array
  end

  def area
    total_area = 0

    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    {"price" => @price,
    "address" => @address}
  end

end
