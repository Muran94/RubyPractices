require 'minitest/autorun'
require './lib/modules/tax'

class TaxTest < Minitest::Test
  def test_constructors
    assert_equal({ normal: 0.10, reduced: 0.08, exempt: 0.00 }, Tax::TYPES)
    assert_equal 0.10, Tax::TYPES[:normal]
    assert_equal 0.08, Tax::TYPES[:reduced]
    assert_equal 0.00, Tax::TYPES[:exempt]

    assert_equal({ round: :round, floor: :floor, ceil: :ceil }, Tax::ROUNDING_METHODS)
    assert_equal :round, Tax::ROUNDING_METHODS[:round]
    assert_equal :floor, Tax::ROUNDING_METHODS[:floor]
    assert_equal :ceil, Tax::ROUNDING_METHODS[:ceil]
  end

  def test_calc_tax_amount
    assert_equal 100, Tax.calc_tax_amount(1_000)
    assert_equal 100, Tax.calc_tax_amount(1_000, tax_type: Tax::TYPES[:normal])
    assert_equal  80, Tax.calc_tax_amount(1_000, tax_type: Tax::TYPES[:reduced])
    assert_equal   0, Tax.calc_tax_amount(1_000, tax_type: Tax::TYPES[:exempt])
    assert_raises(Tax::UnsupportedTaxTypeError) { Tax.calc_tax_amount(1_000, tax_type: 0.12398) }
    
    assert_equal 100, Tax.calc_tax_amount(1_005)
    assert_equal 101, Tax.calc_tax_amount(1_005, rounding_method: Tax::ROUNDING_METHODS[:round])
    assert_equal 100, Tax.calc_tax_amount(1_005, rounding_method: Tax::ROUNDING_METHODS[:floor])
    assert_equal 101, Tax.calc_tax_amount(1_005, rounding_method: Tax::ROUNDING_METHODS[:ceil])
    assert_raises(Tax::UnsupportedRoundingMethodError) { Tax.calc_tax_amount(1_010, rounding_method: :unsupported_value) }
  end
end