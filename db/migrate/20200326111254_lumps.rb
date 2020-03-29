class Lumps < ActiveRecord::Migration[5.1]
  def change
  	add_column :lumps, :height, :integer
  end
end
