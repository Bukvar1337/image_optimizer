class CreateCompressedImages < ActiveRecord::Migration[6.0]
  def change
    create_table :compressed_images do |t|
      t.string :image
      t.timestamps
    end
  end
end
