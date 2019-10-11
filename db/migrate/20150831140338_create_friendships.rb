class CreateFriendships < ActiveRecord::Migration[6.0]
  def self.up
    create_table :friendships do |t|
      t.references :friendable, polymorphic: true
      t.integer  :friend_id
      t.string   :status
      
      t.timestamps
    end
  end

end
