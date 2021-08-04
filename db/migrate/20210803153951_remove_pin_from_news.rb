class RemovePinFromNews < ActiveRecord::Migration[6.1]
  def change
    remove_column :news, :pin, :boolean
  end
end
