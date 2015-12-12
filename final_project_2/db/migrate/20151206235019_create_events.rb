class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :file_upload
      t.integer :user_id
      t.string :image
      t.text :description
      t.text :theme
      t.string :location
      t.string :title
      t.datetime :held_on

      t.timestamps

    end
  end
end
