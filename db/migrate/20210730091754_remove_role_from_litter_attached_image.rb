# frozen_string_literal: true

class RemoveRoleFromLitterAttachedImage < ActiveRecord::Migration[6.1]
  def change
    remove_column :litter_attached_images, :role, :string
  end
end
