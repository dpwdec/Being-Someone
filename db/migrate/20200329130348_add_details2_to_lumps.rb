class AddDetails2ToLumps < ActiveRecord::Migration[5.1]
  def change
    add_column :lumps, :weight, :float
    add_column :lumps, :city, :string
  end
end
