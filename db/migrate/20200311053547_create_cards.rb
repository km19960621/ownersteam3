class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.boolean :pitcher, null: false, default: false
      t.boolean :catcher, null: false, default: false
      t.boolean :first, null: false, default: false
      t.boolean :second, null: false, default: false
      t.boolean :third, null: false, default: false
      t.boolean :short, null: false, default: false
      t.boolean :left, null: false, default: false
      t.boolean :center, null: false, default: false
      t.boolean :right, null: false, default: false
      t.boolean :dh, null: false, default: false

      t.timestamps
    end
  end
end
