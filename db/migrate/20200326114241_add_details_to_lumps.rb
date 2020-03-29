class AddDetailsToLumps < ActiveRecord::Migration[5.1]
  def change
    add_column :lumps, :height, :float
    add_column :lumps, :nick_name, :string
  end
end
