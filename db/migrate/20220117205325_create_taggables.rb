class CreateTaggables < ActiveRecord::Migration[7.0]
  def change
    create_table :taggables do |t|
      t.text :tag_name

      t.timestamps
    end
  end
end
