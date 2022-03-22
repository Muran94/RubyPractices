require './lib/jsonable.rb'

class Article
  include Jsonable

  def title_json
    to_json do |json_builder|
      json_builder.build(type: :string, key: :title, value: 'My Blog')
    end
  end

  def pages_json
    to_json do |json_builder|
      json_builder.build(type: :number, key: :pages, value: '21')
    end
  end
end