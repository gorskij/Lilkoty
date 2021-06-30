# frozen_string_literal: true

class AddDateOfCreationToLitters < ActiveRecord::Migration[6.1]
  def change
    add_column :litters, :date_of_creation, :date
  end
end
