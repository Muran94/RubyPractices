require 'minitest/autorun'
require './lib/movie'

class MovieTest < Minitest::Test
  def test_initialize
    assert Movie.new("When Harry Met Sally")
  end

  def test_shoot!
    movie = Movie.new("When Harry Met Sally")
    assert_output("\u001b[33m---------> When Harry Met Sally\u001b[0m\n") { movie.shoot!(movie.title, color: :yellow, distance: 10) }
  end
end