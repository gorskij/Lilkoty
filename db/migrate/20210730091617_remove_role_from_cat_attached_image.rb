# frozen_string_literal: true

class RemoveRoleFromCatAttachedImage < ActiveRecord::Migration[6.1]
  def change
    remove_column :cat_attached_images, :role, :string
  end
end
