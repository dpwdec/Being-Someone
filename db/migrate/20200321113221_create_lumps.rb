class CreateLumps < ActiveRecord::Migration[5.1]
  def change
    create_table :lumps do |t|
      t.string :name
    end
  end
end
