class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.text :body
      t.string :title
      t.string :priv

      t.timestamps
    end
  end
end
