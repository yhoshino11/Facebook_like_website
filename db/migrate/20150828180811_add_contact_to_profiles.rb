class AddContactToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :twitter, :string
    add_column :profiles, :github, :string
    add_column :profiles, :livecodingtv, :string
  end
end
