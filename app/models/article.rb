class Article < ApplicationRecord
  has_many :tags, dependent: :destroy 
  has_many :taggables, through: :tags

  validates :title, presence: true
  validates :body, presence: true

  around_destroy :murder_orphans

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

  #Destroy taggables that are no longer tagged to anything
  def murder_orphans
    old_taggables = self.taggables
    yield
    old_taggables.each do |el|
      el.destroy if orphaned_taggable?
    end
  end

end
