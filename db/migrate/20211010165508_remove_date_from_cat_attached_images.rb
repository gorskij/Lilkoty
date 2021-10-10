class RemoveDateFromCatAttachedImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :cat_attached_images, :date, :date
  end
end
