class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :follower_id
      t.string :integer
      t.string :followed_id
      t.string :integer

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
