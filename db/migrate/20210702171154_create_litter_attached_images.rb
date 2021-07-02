# frozen_string_literal: true

class CreateLitterAttachedImages < ActiveRecord::Migration[6.1]
  def change
    create_table :litter_attached_images do |t|
      t.integer :litter_id
      t.string :role
      t.timestamps
    end
  end
end
