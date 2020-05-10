class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :name
      t.integer :pitcher_card_id
      t.integer :catcher_card_id
      t.integer :first_card_id
      t.integer :second_card_id
      t.integer :third_card_id
      t.integer :short_card_id
      t.integer :left_card_id
      t.integer :center_card_id
      t.integer :right_card_id
      t.integer :dh_card_id

      t.timestamps
    end
  end
end
