class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :guest_name
      t.integer :identifier
      t.integer :event_id
      t.integer :user_id

      t.timestamps

    end
  end
end
