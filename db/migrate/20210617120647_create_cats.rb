# frozen_string_literal: true

class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.references :mother, foreign_key: { to_table: :cats }
      t.references :father, foreign_key: { to_table: :cats }
      t.string :status
      t.string :sex
      t.string :colour
      t.string :breed
      t.string :breeding
      t.integer :litter_id
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
