# frozen_string_literal: true

class ChangeTypeOfDatebirth < ActiveRecord::Migration[6.1]
  def change
    change_column :cats, :date_of_birth, :date
  end
end
