require "test_helper"

class TaggableTest < ActiveSupport::TestCase
  test "taggable cannot be empty" do
    el = Taggable.new
    assert_not el.save, "A taggable cannot be saved with no tag name set"
  end

  test "taggable length outside acceptable range" do
    el = Taggable.new(tag_name: "aaaaaaaaaaa")
    assert_not el.save, "taggable length is outside the acceptable range"
  end

  test "taggable format is not alphanumeric" do
    el = Taggable.new(tag_name: "a a")
    assert_not el.save
  end
end
