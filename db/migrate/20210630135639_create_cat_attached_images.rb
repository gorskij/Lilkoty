# frozen_string_literal: true

class CreateCatAttachedImages < ActiveRecord::Migration[6.1]
  def change
    create_table :cat_attached_images do |t|
      t.integer :cat_id
      t.string :role
      t.date :date
      t.timestamps
    end
  end
end
