class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.text :title
      t.text :content
      t.string :video_url
      t.boolean :pin
      t.timestamps
    end
  end
end
