# frozen_string_literal: true

class ChangeCatsBreed < ActiveRecord::Migration[6.1]
  def change
    remove_column :cats, :breed, :string
    add_column :cats, :breed_id, :integer, references: :breeds
  end
end
