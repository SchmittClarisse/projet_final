class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :author
      t.string :image_url

      t.timestamps
    end
  end
end
