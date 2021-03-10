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
  info = {}
  @vendors.each do |vendor|
    vendor.inventory.each do |item|
      if info[item[0]].nil?
        info[item[0]] = {quantity: 0, vendors: []}
      end
      info[item[0]][:quantity] += item[1]
      info[item[0]][:vendors] << vendor
      end
    end
    info
  end
end
