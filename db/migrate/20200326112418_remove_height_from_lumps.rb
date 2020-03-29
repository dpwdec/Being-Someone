class RemoveHeightFromLumps < ActiveRecord::Migration[5.1]
  def change
    remove_column :lumps, :height, :integer
  end
end
