require 'minitest/autorun'
require './lib/product'

class ProductTest < Minitest::Test
  def test_initialize
    assert Product.new("Fender", 128900)
  end

  def test_shoot!
    product = Product.new("Fender", 128900)

    assert_output("\u001b[31m---------> Fender\u001b[0m\n") { product.shoot!(product.name, color: :red, distance: 10) }
    assert_output("\u001b[36m----> ¥128,900\u001b[0m\n") { product.shoot!(product.formatted_price, color: :cyan, distance: 5) }
  end
end