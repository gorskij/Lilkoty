# frozen_string_literal: true

class CreateLitters < ActiveRecord::Migration[6.1]
  def change
    create_table :litters do |t|
      t.string :name
      t.integer :mother_id
      t.integer :father_id

      t.timestamps
    end
  end
end
