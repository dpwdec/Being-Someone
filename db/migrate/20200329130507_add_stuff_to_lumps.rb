class AddStuffToLumps < ActiveRecord::Migration[5.1]
  def change
    add_column :lumps, :birth_date, :date
    add_column :lumps, :fantastical, :boolean
  end
end
