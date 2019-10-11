class AddUserToProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :profiles, :user, index: true, foreign_key: true
  end
end
