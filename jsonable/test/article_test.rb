require 'minitest/autorun'
require './lib/article'

class ArticleTest < Minitest::Test
  def setup
    @article = Article.new
  end

  def test_title_json
    assert_equal [{title: 'My Blog'}], @article.title_json
  end

  def test_pages_json
    assert_equal [{pages: 21}], @article.pages_json
  end
end