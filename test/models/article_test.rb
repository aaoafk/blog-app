require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  # Article Model Validations
  test "article title cannot be empty" do
    article = Article.new
    assert_not article.save, "Article title cannot be empty"
  end

  test "article body cannot be empty" do
    article = Article.new(title: "the title", body: "", tag_names: "yeah")
    assert_not article.save, "Article body cannot be empty"
  end
end
