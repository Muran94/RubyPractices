require 'minitest/autorun'
require './lib/expence'
require './lib/modules/tax'

class ExpenceTest < Minitest::Test
  def setup
    @expence = Expence.new(30_012)
  end

  def test_amount_including_tax
    assert_equal 33_013, @expence.amount_including_tax
    assert_equal 32_412, @expence.amount_including_tax(tax_type: Tax::TYPES[:reduced])
    assert_equal 30_012, @expence.amount_including_tax(tax_type: Tax::TYPES[:exempt])
    assert_equal 33_014, @expence.amount_including_tax(rounding_method: Tax::ROUNDING_METHODS[:ceil])
  end
end