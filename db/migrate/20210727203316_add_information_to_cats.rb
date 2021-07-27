# frozen_string_literal: true

class AddInformationToCats < ActiveRecord::Migration[6.1]
  def change
    add_column :cats, :health, :text
    add_column :cats, :personality, :text
  end
end
