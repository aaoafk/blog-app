class ChangeTagsToTagNamesArticles < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :tags, :tag_names
  end
end
