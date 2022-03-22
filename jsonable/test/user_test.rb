require 'minitest/autorun'
require './lib/user'

class UserTest < Minitest::Test
  def setup
    @user = User.new
  end

  def test_name_json
    assert_equal [{name: 'Kaori'}], @user.name_json
  end

  def test_age_json
    assert_equal [{age: 21}], @user.age_json
  end
end