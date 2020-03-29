class AddLuttoBuToLumps < ActiveRecord::Migration[5.1]
  def change
    add_column :lumps, :exists, :boolean
  end
end
