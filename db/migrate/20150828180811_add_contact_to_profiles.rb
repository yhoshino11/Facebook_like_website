class AddContactToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :skype, :string
    add_column :profiles, :twitter, :string
    add_column :profiles, :github, :string
    add_column :profiles, :livecodingtv, :string
  end
end
