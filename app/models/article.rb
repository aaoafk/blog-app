class Article < ApplicationRecord
  has_many :tags, dependent: :destroy #TODO: Review how dependent: :destroy works with this association
  has_many :taggables, through: :tags

  validates :title, presence: true
  validates :body, presence: true

  # Add new taggables
  def self.build_taggables(new_taggables)
    new_taggables.each do |el|
      Taggable.add_taggable el 
    end
  end

  # Add tags as needed
  def self.stick_tags(article, tag_names)
    taggables = Taggable.get_taggables tag_names 
    taggables.each do |el|
      article.tags.create(taggable_id: el.id) unless article.taggables.exists? tag_name: el.tag_name
    end
  end

end
