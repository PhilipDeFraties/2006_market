require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor.rb'
require './lib/item.rb'
class VendorTest < MiniTest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_can_have_a_name
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_it_has_no_inventory_by_default
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal [], vendor.inventory
  end

  def test_it_can_check_quantitiy_of_item
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    assert_equal 0, vendor.check_stock(item1)
  end

end
