# 消費税
module Tax
  class UnsupportedTaxTypeError < StandardError; end
  class UnsupportedRoundingMethodError < StandardError; end

  # 各種税率
  TYPES = {
    normal:  0.10, # 通常税率。10%。
    reduced: 0.08, # 軽減税率。8%。
    exempt:  0.00, #非課税。0%。
  }.freeze

  # 端数処理
  ROUNDING_METHODS = {
    round: :round, # 四捨五入
    floor: :floor, # 切り捨て
    ceil:  :ceil,  # 切り上げ
  }.freeze

  module_function

  # 消費税額を計算する
  # ==== 引数
  # * +amount_of_money+ - 課税対象となる金額
  # * +tax_type+ - 税率。デフォルトでは10%。
  # * +rounding_method+ - 端数処理。デフォルトでは切り捨て。
  def calc_tax_amount(amount_of_money, tax_type: TYPES[:normal], rounding_method: ROUNDING_METHODS[:floor])
    raise UnsupportedTaxTypeError, "Argument passed is unsupported. tax_type: #{tax_type}" unless TYPES.values.include?(tax_type)
    raise UnsupportedRoundingMethodError, "Argument passed is unsupported. rounding_method: #{rounding_method}" unless ROUNDING_METHODS.values.include?(rounding_method)

    (amount_of_money * tax_type).send(rounding_method)
  end
end