class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name, default: 'Anonymous'
      t.timestamps null: false
    end
  end
end
