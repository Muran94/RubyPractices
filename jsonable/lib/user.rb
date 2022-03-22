require './lib/jsonable.rb'

class User
  include Jsonable

  def name_json
    to_json do |json_builder|
      json_builder.build(type: :string, key: :name, value: 'Kaori')
    end
  end

  def age_json
    to_json do |json_builder|
      json_builder.build(type: :number, key: :age, value: '21')
    end
  end
end