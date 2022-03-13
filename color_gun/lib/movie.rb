require './lib/modules/color_gun'

class Movie
  include ColorGun

  attr_reader :title

  def initialize(title)
    @title = title
  end
end