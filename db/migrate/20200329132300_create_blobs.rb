class CreateBlobs < ActiveRecord::Migration[5.1]
  def change
    create_table :blobs do |t|
      t.string :name
      t.float :blobby_factor
      t.boolean :permeable

      t.timestamps
    end
  end
end
