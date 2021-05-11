class CreateAddFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :add_friends do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
