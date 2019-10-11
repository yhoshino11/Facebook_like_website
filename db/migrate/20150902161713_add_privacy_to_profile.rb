class AddPrivacyToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :f_list_privacy, :boolean, default: false
  end
end
