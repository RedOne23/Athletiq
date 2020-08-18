class AddNameToFacilities < ActiveRecord::Migration[6.0]
  def change
    add_column :facilities, :name, :string
  end
end
