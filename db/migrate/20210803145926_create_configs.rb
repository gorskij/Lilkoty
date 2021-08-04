class CreateConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :configs do |t|
      t.integer :pinned_news_id
      t.integer :default_relevant_news_limit
      t.timestamps
    end
  end
end
