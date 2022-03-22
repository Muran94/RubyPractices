module Jsonable
  class UnsupportedConvertTypeError < StandardError; end

  CONVERTABLE_TYPES = %i(string number).freeze

  def to_json(&block)
    yield self
  end

  def build(type: :string, key:, value:)
    [{ key => convert_to(type, value) }]
  end

  private

  def convert_to(type, value)
    case type
    when :string then value.to_s
    when :number then value.to_i
    else
      raise 
    end
  end
end