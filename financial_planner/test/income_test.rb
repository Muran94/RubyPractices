require 'minitest/autorun'
require './lib/income'
require './lib/modules/tax'

class IncomeTest < Minitest::Test
  def setup
    @income = Income.new(30_012)
  end

  def test_amount_including_tax
    assert_equal 33_013, @income.amount_including_tax
    assert_equal 32_412, @income.amount_including_tax(tax_type: Tax::TYPES[:reduced])
    assert_equal 30_012, @income.amount_including_tax(tax_type: Tax::TYPES[:exempt])
    assert_equal 33_014, @income.amount_including_tax(rounding_method: Tax::ROUNDING_METHODS[:ceil])
  end
end