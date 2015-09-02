class AddPrivacyToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :f_list_privacy, :boolean, default: false
  end
end
