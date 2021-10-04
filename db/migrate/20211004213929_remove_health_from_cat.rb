class RemoveHealthFromCat < ActiveRecord::Migration[6.1]
  def change
    remove_column :cats, :health, :text
  end
end
