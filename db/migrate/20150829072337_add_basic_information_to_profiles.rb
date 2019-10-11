class AddBasicInformationToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :born_country, :string
    add_column :profiles, :born_city, :integer
    add_column :profiles, :residence_country, :string
    add_column :profiles, :residence_city, :integer
    add_column :profiles, :status, :string
    add_column :profiles, :sex, :integer
  end
end
