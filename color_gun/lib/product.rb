require 'active_support/core_ext/numeric/conversions'
require './lib/modules/color_gun'

class Product
  include ColorGun

  attr_reader :name, :price

  def initialize(name, price)
    @name  = name
    @price = price
  end

  def formatted_price
    %(¥#{ price.to_s(:delimited) })
  end
end