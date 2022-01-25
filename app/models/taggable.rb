class Taggable < ApplicationRecord
  has_many :tags
  has_many :articles, through: :tags
  validates :tag_name, 
    presence: true, 
    length: { within: 1..10 }, 
    format: { with: /[a-zA-Z0-9]+/ }

  def self.add_taggable(new_taggable_name)
    taggable = Taggable.new(tag_name: new_taggable_name)
    taggable.save unless Taggable.find_by tag_name: new_taggable_name
  end
  
  def self.get_taggables(taggables)
    Taggable.where(['tag_name in (?)', taggables])
  end

  #An orphan taggable is a taggable that doesn't refer to any articles anymore
  def orphaned_taggable?
    tags.count == 0
  end
end
