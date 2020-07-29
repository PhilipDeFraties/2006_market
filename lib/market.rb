require 'pry'
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
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors_array = []
    @vendors.each do |vendor|
      if vendor.inventory.keys.include?(item)
        vendors_array << vendor
      end
    end
    vendors_array
  end

  def total_inventory
    total_inventory_hash = {}
    total_inventory_hash_final = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if total_inventory_hash[item]
          total_inventory_hash[item] += quantity
        else
          total_inventory_hash[item] = quantity
        end
      end
    end
    h = Hash.new {|item, quantity, vendor| item[quantity] = total_inventory_hash.value, item[vendor] = total_inventory_hash.item}

  end

end
