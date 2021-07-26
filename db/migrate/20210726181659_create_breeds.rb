# frozen_string_literal: true

class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :name
      t.text :personality
      t.text :history
      t.text :allergy_informations
      t.text :physical_attributes
      t.timestamps
    end
  end
end
