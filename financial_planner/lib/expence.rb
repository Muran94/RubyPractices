require './lib/modules/tax'

# 支出を表すクラス
class Expence
  attr_reader :amount # :nodoc:

  # ==== 引数
  # * +amount+ - 金額
  def initialize(amount)
    @amount = amount
  end

  # 消費税込みの収入を返す。
  # ==== 引数
  # * +tax_type+ - 消費税率。Taxモジュールに定義されている各種税率のいずれか。
  # * +rounding_method+ - 端数処理。Taxモジュールに定義されている端数処理のいずれか。
  # ==== 戻り値
  # * +Integer+ - 消費税込みの金額を返す。四捨五入。
  def amount_including_tax(tax_type: Tax::TYPES[:normal], rounding_method: Tax::ROUNDING_METHODS[:floor])
    tax_amount = Tax.calc_tax_amount(amount, tax_type: tax_type, rounding_method: rounding_method)

    amount + tax_amount
  end
end