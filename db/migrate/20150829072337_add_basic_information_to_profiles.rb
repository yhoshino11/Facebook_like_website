class AddBasicInformationToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :born_country, :integer
    add_column :profiles, :born_city, :integer
    add_column :profiles, :residence_country, :integer
    add_column :profiles, :residence_city, :integer
    add_column :profiles, :status, :integer
    add_column :profiles, :sex, :integer
  end
end
