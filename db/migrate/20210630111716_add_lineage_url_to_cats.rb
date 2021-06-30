# frozen_string_literal: true

class AddLineageUrlToCats < ActiveRecord::Migration[6.1]
  def change
    add_column :cats, :lineage_url, :string
  end
end
