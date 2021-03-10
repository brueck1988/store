class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendor_names = []
    @vendors.each do |vendor|
      vendor_names << vendor.name
    end
    vendor_names
  end

  def vendors_that_sell(item)
    vendors_with_item = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |inventory_item|
        vendors_with_item << vendor if inventory_item.name == item.name
      end
    end
    vendors_with_item
  end

  def total_inventory
  @total_inventory = {}
  @vendors.each do |vendor|
    vendor.inventory.each do |item|
      if @total_inventory[item[0]].nil?
        @total_inventory[item[0]] = {quantity: 0, vendors: []}
      end
      @total_inventory[item[0]][:quantity] += item[1]
      @total_inventory[item[0]][:vendors] << vendor
      end
    end
    @total_inventory
  end

  def overstocked_items
    overstocked_items = []
    @total_inventory.each do |item_inventory|
      if item_inventory[1][:quantity] > 50 && item_inventory[1][:vendors].count > 1
        overstocked_items << item_inventory[0]
      end
    end
    overstocked_items
  end
end
